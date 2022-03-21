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
    local center = hs.geometry.rectMidPoint(rect)
    hs.mouse.absolutePosition(center)

    drawMouseCircle(2)
  end)
end

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "s", function()
  for screen, pos in pairs(monitors) do
    hs.alert("Screen " .. (pos.x + offset), {}, screen)
  end
end)
