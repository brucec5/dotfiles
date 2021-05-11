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

-- Static application switcher keybinds
hs.hotkey.bind({"cmd", "ctrl"}, "/", function()
  focusWindow("Slack")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "/", function()
  focusWindow("Microsoft Teams")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "p", function()
  focusWindow("Citrix SSO")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, ".", function()
  focusWindow("com.webex.meetingmanager")
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

function pickWindow(choice)
  if choice == nil then
    logger.i("Not picking any window")
    return
  end

  logger.i("Picking window " .. choice.text)
  local window = hs.window.get(choice.windowId)
  window:focus()
end

chooser = hs.chooser.new(pickWindow)

-- some windows are dumb and I don't want to find them
function shouldSkipWindow(win)
  if not win:isStandard() then return true end
  if win:title() == "Microsoft Teams Notification" then return true end
end

function windowFinderChoices()
  logger.i("getting choices")
  return hs.fnutils.map(
    hs.window.allWindows(),
    function(win)
      if shouldSkipWindow(win) then
        return nil
      end

      local app = win:application()

      return {
        text    = win:title(),
        subText = app:name(),
        image   = hs.image.imageFromAppBundle(app:bundleID()),
        windowId    = win:id()
      }
    end
  )
end

chooser:choices(windowFinderChoices):searchSubText(true)

hs.hotkey.bind({"cmd", "alt"}, "i", function() chooser:show() end)
hs.hotkey.bind({"cmd", "alt", "shift"}, "i", function() chooser:hide() end)
