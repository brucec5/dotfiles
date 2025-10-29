local logger = hs.logger.new("meetings", "info")

function toggleMute()
  local teams = hs.application.find("com.microsoft.teams2")
  if teams then
    hs.eventtap.keyStroke({"cmd", "shift"}, "m", 0, teams)
  end

  local webex = hs.application.find("Cisco-Systems.Spark")
  if webex then
    hs.eventtap.keyStroke({"cmd", "ctrl", "shift"}, "m", 0)
  end
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "m", toggleMute)
