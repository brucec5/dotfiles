local logger = hs.logger.new("remind", "info")

hs.hotkey.bind({"ctrl", "alt"}, "r", function()
  logger.i("Sending notification")
  local n = hs.notify.new(function(c)
    local response = c:response()
    local action = c:additionalActivationAction()
    local time = ""
    if response ~= nil then
      logger.i("Handled click, response: " .. response)
      time = response
    elseif action ~= nil then
      logger.i("Handled click, action: " .. action)
      time = action
    else
      logger.i("Handled click, not given action or response")
      return
    end
    logger.i("Will reschedule the alert in " .. time)
    --[[
    Parsing a time:
      split (via regex?) into number and unit
    --]]
  end, {
    autoWithdraw = false,
    informativeText = "This is a notification",
    title = "A Notification",
    subTitle = "A Subtitle",

    hasActionButton = true,
    actionButtonTitle = "Dismiss",
    additionalActions = { "10m", "30m", "1h", "2h" },
    hasReplyButton = true,
  })

  n:send()
end)
