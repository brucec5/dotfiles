--local mapping = { 2, 1, 3 }
-- changing this while working from home, since my monitor setup is different
-- TODO: add ability to switch monitor schemes dynamically?
-- TODO: consider sharing the mapping object between mouse and screens modules
local mapping = { 1, 2 }

for i, screenIndex in ipairs(mapping) do
  hs.hotkey.bind({"ctrl", "alt", "cmd"}, tostring(i), function()
    local screen = hs.screen.allScreens()[screenIndex]

    if screen then
      local rect = screen:fullFrame()
      local center = hs.geometry.rectMidPoint(rect)
      hs.mouse.setAbsolutePosition(center)
    end
  end)
end

local mouseCircle = nil
local mouseCircleTimer = nil

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "D", function()
  if mouseCircle then
    mouseCircle:delete()
    if mouseCircleTimer then
      mouseCircleTimer:stop()
    end
  end

  mousePoint = hs.mouse.getAbsolutePosition()

  mouseCircle = hs.drawing.circle(
    hs.geometry.rect(
      mousePoint.x - 40,
      mousePoint.y - 40,
      80,
      80
    )
  )
  mouseCircle:setStrokeColor({["red"]=1, ["green"]=0, ["blue"]=0, ["alpha"]=1})
  mouseCircle:setFill(false)
  mouseCircle:setStrokeWidth(5)
  mouseCircle:show()

  mouseCircleTimer = hs.timer.doAfter(3, function()
    mouseCircle:delete()
  end)
end)
