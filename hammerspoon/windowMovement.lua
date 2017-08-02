-- Set to true if weird window movement/resizing issues are encountered
-- Will make window movement/resizing a bit less snappy.
hs.window.setFrameCorrectness = false

local mash = {
  grow = {"alt", "ctrl", "cmd"},
  snap = {"alt", "ctrl"},
  shrink = {"cmd", "ctrl"},
  shrinkSmall = {"cmd", "ctrl", "shift"},
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

-- Shrink by a quarter horizontally, to the left
hs.hotkey.bind(mash.shrinkSmall, "left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.w = f.w * 3 / 4
  win:setFrame(f)
end)

-- Shrink by a quarter horizontally, to the right
hs.hotkey.bind(mash.shrinkSmall, "right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = f.x + f.w / 4
  f.w = f.w * 3 / 4
  win:setFrame(f)
end)

-- Shrink by a quarter vertically, upwards
hs.hotkey.bind(mash.shrinkSmall, "up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.h = f.h * 3 / 4
  win:setFrame(f)
end)

-- Shrink by a quarter vertically, downwards
hs.hotkey.bind(mash.shrinkSmall, "down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.y = f.y + f.h / 4
  f.h = f.h * 3 / 4
  win:setFrame(f)
end)

-- Double horizontal size leftwards
hs.hotkey.bind(mash.grow, "left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = f.x - f.w
  f.w = f.w * 2
  win:setFrame(f)
end)

-- Double horizontal size rightwards
hs.hotkey.bind(mash.grow, "right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.w = f.w * 2
  win:setFrame(f)
end)

-- Double vertical size upwards
hs.hotkey.bind(mash.grow, "up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.y = f.y - f.h
  f.h = f.h * 2
  win:setFrame(f)
end)

-- Double vertical size downwards
hs.hotkey.bind(mash.grow, "down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.h = f.h * 2
  win:setFrame(f)
end)
