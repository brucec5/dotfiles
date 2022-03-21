local logger = hs.logger.new("mouse", "info")

local mouseCircle = nil
local mouseCircleTimer = nil

function drawMouseCircle(duration)
  logger.d("Drawing mouse circle " .. hs.inspect.inspect(mouseCircle))
  if mouseCircle and next(mouseCircle) ~= nil then
    mouseCircle:delete()
  end

  if mouseCircleTimer and mouseCircleTimer ~= nil then
    mouseCircleTimer:stop()
  end

  mousePoint = hs.mouse.absolutePosition()

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
  mouseCircle:setStrokeWidth(3)
  mouseCircle:show()

  mouseCircleTimer = hs.timer.doAfter(duration, function()
    mouseCircle:delete()
  end)
end

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "D", function()
  drawMouseCircle(3)
end)
