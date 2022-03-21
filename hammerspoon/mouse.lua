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
