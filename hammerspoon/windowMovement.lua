local logger = hs.logger.new("windowMovement", "info")

-- Set to true if weird window movement/resizing issues are encountered
-- Will make window movement/resizing a bit less snappy.
hs.window.setFrameCorrectness = false

local mash = {
  snap = {"alt", "ctrl"},
  shrink = {"cmd", "ctrl"},
  move = {"alt", "ctrl", "cmd"},
}

-- TODO: DRY this up

-- Move to left half of screen
hs.hotkey.bind(mash.snap, "left", function()
  local win = hs.window.focusedWindow()
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
  local win = hs.window.focusedWindow()
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
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()

  win:setFrame(screen:frame())
end)

-- Shrink by half horizontally, to the left
hs.hotkey.bind(mash.shrink, "left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.w = f.w / 2
  win:setFrame(f)
end)

-- Shrink by half horizontally, to the right
hs.hotkey.bind(mash.shrink, "right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.w = f.w / 2
  f.x = f.x + f.w
  win:setFrame(f)
end)

-- Shrink by half vertically, upwards
hs.hotkey.bind(mash.shrink, "up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.h = f.h / 2
  win:setFrame(f)
end)

-- Shrink by half vertically, downwards
hs.hotkey.bind(mash.shrink, "down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.h = f.h / 2
  f.y = f.y + f.h
  win:setFrame(f)
end)

function screenCount()
  local count = 0

  for i in pairs(hs.screen.screenPositions()) do
    count = count + 1
  end

  return count
end

-- Move window one monitor leftwards
hs.hotkey.bind(mash.move, "left", function()
  local win = hs.window.focusedWindow()
  local pos = win:screen():position()
  local newPos = (pos + 1) % screenCount()

  win:moveToScreen{x=newPos,y=0}
end)

-- Move window one monitor rightwards
hs.hotkey.bind(mash.move, "right", function()
  local win = hs.window.focusedWindow()
  local pos = win:screen():position()
  local newPos = (pos - 1) % screenCount()

  win:moveToScreen{x=newPos,y=0}
end)
