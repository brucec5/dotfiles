local logger = hs.logger.new("windowSwitching", "info")

function focusWindow(appName)
  local theApp = hs.application.get(appName)
  if theApp then
    local theWindow = theApp:mainWindow()

    if theWindow then
      theWindow:focus()
    end
  end
end

hs.application.enableSpotlightForNameSearches(true)

-- Static application switcher keybinds
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "/", function()
  focusWindow("Microsoft Teams")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "o", function()
  focusWindow("Microsoft Outlook")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "p", function()
  focusWindow("Citrix SSO")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, ".", function()
  focusWindow("Cisco Webex Meetings")
end)

-- Application Switcher
switcher = hs.window.switcher.new()

hs.hotkey.bind(
  {"alt"},
  "tab",function() switcher:next() end,
  nil,
  function() switcher:next() end
)

hs.hotkey.bind(
  {"alt", "shift"},
  "tab",function() switcher:previous() end,
  nil,
  function() switcher:previous() end
)

-- Hints
hs.hints.showTitleThresh = 10
hs.hints.style = "vimperator"

hs.hotkey.bind({"cmd"}, "escape", function()
  hs.hints.windowHints()
end)

-- Hints for focused window's application
hs.hotkey.bind({"alt"}, "escape", function()
  hs.hints.windowHints(
    hs.window.focusedWindow():application():allWindows()
  )
end)

-- Fuzzy Window Switcher
-- Mostly cribbed from https://gist.github.com/RainmanNoodles/70aaff04b20763041d7acb771b0ff2b2

fuzzyChoices = nil
fuzzyChooser = nil

function pickWindow(choice)
  if choice == nil then
    logger.i("Not picking any window")
    return
  end

  logger.i("Picking window " .. choice.text)
  local window = hs.window.get(choice.windowId)
  if window == nil then
    logger.i("Found window was nil!")
    return
  end
  window:focus()
end

-- some windows are dumb and I don't want to find them
function shouldSkipWindow(win)
  if not win:isStandard() then return true end
  if win:title() == "Microsoft Teams Notification" then return true end
end

-- Fuzzily find a query within text.
-- Basically, it finds a subsequence in text with the characters from query,
-- and uses how long that subsequence is to define a score (shorter subsequence means better score)
function fuzzyQuery(text, query)
  textIndex = 1
  queryIndex = 1
  matchStart = nil

  while true do
    if textIndex > text:len() or queryIndex > query:len() then
      return -1
    end

    textChar = text:sub(textIndex, textIndex)
    queryChar = query:sub(queryIndex, queryIndex)

    if textChar == queryChar then
      if matchStart == nil then
        matchStart = textIndex
      end

      textIndex = textIndex + 1
      queryIndex = queryIndex + 1

      if queryIndex > query:len() then
        matchEnd = textIndex
        textMatchLength = matchEnd - matchStart
        score = query:len() / textMatchLength
        return score
      end
    else
      textIndex = textIndex + 1
    end
  end
end

Matrix = {}

function Matrix:new(width, height)
  m = {
    width = width,
    height = height,
    data = {}
  }

  setmetatable(m, self)
  self.__index = self
  return m
end

function Matrix:set(x, y, value)
  self.data[y * self.width + x] = value
end

function Matrix:get(x, y, default)
  return self.data[y * self.width + x] or default
end

function fuzzyQueryDP(text, query)
  if #query > #text then return nil end

  scores = Matrix:new(text:len(), query:len())

  for qIndex=1, #query do
    max = nil
    maxIndex = 1

    for tIndex=qIndex, #text do
      t = text:sub(tIndex, tIndex)
      q = query:sub(qIndex, qIndex)

      -- print("looking at t='" .. t .. "' q='" .. q .. "' index=" .. tIndex)

      if t == q then
        max = max or -100
        previous = scores:get(tIndex - 1, qIndex - 1, {score = 0, max = 0, maxIndex = tIndex-1})

        if previous.max == nil then
          goto continue
        end

        gap = tIndex - previous.maxIndex - 1
        score = previous.max + 1 - gap
        if score >= max then
          maxIndex = tIndex
        end
        max = math.max(max, score)

        scores:set(tIndex, qIndex, {score = score, max = max, maxIndex = maxIndex})
      else
        scores:set(tIndex, qIndex, {score = nil, max = max, maxIndex = maxIndex})
      end
      ::continue::
    end

    if max == nil then
      return nil
    end
  end

  globalMax = nil
  for tIndex=#query, #text do
    score = scores:get(tIndex, #query)
    -- print("getting score=" .. (score.score or "nil") .. " max=" .. score.max .. " maxIndex=" .. maxIndex)

    if score ~= nil and score.score ~= nil then
      -- print("we got score " .. score.score)
      if globalMax == nil then
        globalMax = score.score
      else
        globalMax = math.max(globalMax, score.score)
      end
    end
  end

  return globalMax
end

function fuzzyFilterChoices(query)
  if query:len() == 0 then
    fuzzyChooser:choices(fuzzyChoices)
    return
  end

  pickedChoices = hs.fnutils.map(
    fuzzyChoices,
    function(choice)
      fullText = (choice.text .. " " .. choice.subText):lower()
      score = fuzzyQueryDP(fullText, query:lower())

      if score ~= nil then
        choice["fzf_score"] = score
        return choice
      else
        return nil
      end
    end
  )

  local sortFunc = function(a,b) return a.fzf_score > b.fzf_score end
  table.sort(pickedChoices, sortFunc)
  fuzzyChooser:choices(pickedChoices)
end

function windowFuzzySearch()
  fuzzyChoices = hs.fnutils.map(
    hs.window.filter.default:getWindows(hs.window.filter.sortByFocusedLast),
    function(win)
      if shouldSkipWindow(win) then return nil end

      local app = win:application()

      return {
        text = win:title(),
        subText = app:name(),
        image = hs.image.imageFromAppBundle(app:bundleID()),
        windowId = win:id()
      }
    end
  )

  fuzzyChooser = hs.chooser.new(pickWindow):choices(fuzzyChoices):searchSubText(true)
  fuzzyChooser:queryChangedCallback(fuzzyFilterChoices)
  fuzzyChooser:show()
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "j", windowFuzzySearch)
