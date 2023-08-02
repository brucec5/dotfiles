local logger = hs.logger.new("windowMovement", "info")

-- Set to true if weird window movement/resizing issues are encountered
-- Will make window movement/resizing a bit less snappy.
hs.window.setFrameCorrectness = false

local ignoredWindows = {
  "Microsoft Teams Notification"
}

local mash = {
  snap = {"alt", "ctrl"},
  shrink = {"cmd", "ctrl"},
  move = {"alt", "ctrl", "cmd"},
}

function ignoreWindow(win, app)
  for _, title in ipairs(ignoredWindows) do
    logger.d("comparing " .. title .. " to " .. win:title())
    if win:title() == title then
      return true
    end
  end

  if app:name() == "Microsoft Outlook" and win:title():match("%d Reminders?") then
    logger.d("ignoring " .. win:title() .. " due to it being the outlook reminders")
    return true
  end

  return false
end

-- Sometimes there's a phantom window that hammerspoon considers frontmost.
-- To work around that, we reimplement frontmostWindow to also take into account
-- an "ignore" list of window titles.
function getFrontmostWindow()
  local w = hs.window.focusedWindow()
  if w then return w end

  for _, win in ipairs(hs.window.orderedWindows()) do
    local app = win:application()
    logger.d("win: " .. win:title() .. " attr: " .. tostring(win:subrole()))

    if ignoreWindow(win, app) then
      logger.d(win:title() .. " ignored")
    elseif (app and app:title() ~= "Hammerspoon") or win:subrole() ~= "AXUnknown" then
      return win
    end
  end

  return nil
end

-- TODO: DRY this up

-- Move to left half of screen
hs.hotkey.bind(mash.snap, "left", function()
  local win = getFrontmostWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Move to right half of screen!
hs.hotkey.bind(mash.snap, "right", function()
  local win = getFrontmostWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + max.w / 2
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Maximize
hs.hotkey.bind(mash.snap, "up", function()
  local win = getFrontmostWindow()
  local f = win:frame()
  local screen = win:screen()

  win:setFrame(screen:frame())
end)

-- Shrink by half horizontally, to the left
hs.hotkey.bind(mash.shrink, "left", function()
  local win = getFrontmostWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.w = f.w / 2
  win:setFrame(f)
end)

-- Shrink by half horizontally, to the right
hs.hotkey.bind(mash.shrink, "right", function()
  local win = getFrontmostWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.w = f.w / 2
  f.x = f.x + f.w
  win:setFrame(f)
end)

-- Shrink by half vertically, upwards
hs.hotkey.bind(mash.shrink, "up", function()
  local win = getFrontmostWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.h = f.h / 2
  win:setFrame(f)
end)

-- Shrink by half vertically, downwards
hs.hotkey.bind(mash.shrink, "down", function()
  local win = getFrontmostWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.h = f.h / 2
  f.y = f.y + f.h
  win:setFrame(f)
end)

-- Move window one monitor leftwards
hs.hotkey.bind(mash.move, "left", function()
  moveToScreenDelta(getFrontmostWindow(), -1)
end)

-- Move window one monitor rightwards
hs.hotkey.bind(mash.move, "right", function()
  moveToScreenDelta(getFrontmostWindow(), 1)
end)
