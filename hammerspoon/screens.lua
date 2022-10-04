local logger = hs.logger.new("screens", "info")

local monitors = hs.screen.screenPositions()

local monitorCount = 0
local minXPosition = 100
for screen, pos in pairs(monitors) do
  monitorCount = monitorCount + 1
  if pos.x < minXPosition then
    minXPosition = pos.x
  end
end

function screenCount()
  local count = 0

  for i in pairs(hs.screen.screenPositions()) do
    count = count + 1
  end

  return count
end

function getScreenWithDelta(screen, delta)
  local pos = screen:position()
  local newPos = (pos + delta) % screenCount()

  -- This assumes that I only ever use one row of monitors, which I think is a safe assumption
  return hs.screen{x=newPos, y=0}
end

function moveToScreenDelta(win, delta)
  win:moveToScreen(getScreenWithDelta(win:screen(), delta))
end

-- Offset makes it so the leftmost monitor is index 1, even if the main monitor is in the middle or elsewhere.
local offset = -minXPosition + 1

logger.i("we have " .. monitorCount .. " monitors, min x is " .. minXPosition)

for screen, pos in pairs(monitors) do
  logger.i("Binding for screen " .. hs.inspect.inspect(screen))

  local i = pos.x + offset
  hs.hotkey.bind({"ctrl", "alt"}, tostring(i), function()
    logger.d("Moving window to screen " .. hs.inspect.inspect(screen))
    local win = hs.window.focusedWindow()

    win:moveToScreen(screen)
    win:setFrame(screen:frame())
  end)

  hs.hotkey.bind({"ctrl", "alt", "cmd"}, tostring(i), function()
    logger.d("Moving mouse to screen " .. hs.inspect.inspect(screen))

    local rect = screen:fullFrame()
    moveMouseTo(rect)
  end)
end

hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, "left", function()
  local screen = getScreenWithDelta(hs.mouse.getCurrentScreen(), -1)
  logger.d("Moving mouse to screen " .. hs.inspect.inspect(screen))

  local rect = screen:fullFrame()
  moveMouseTo(rect)
end)

hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, "right", function()
  local screen = getScreenWithDelta(hs.mouse.getCurrentScreen(), 1)
  logger.d("Moving mouse to screen " .. hs.inspect.inspect(screen))

  local rect = screen:fullFrame()
  moveMouseTo(rect)
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "s", function()
  for screen, pos in pairs(monitors) do
    hs.alert("Screen " .. (pos.x + offset) .. "/" .. monitorCount, {}, screen)
  end
end)
