local logger = hs.logger.new("windowSwitching", "info")

function focusWindow(...)
  local arg = {...}
  for i, appName in ipairs(arg) do
    local theApp = hs.application.get(appName)
    if theApp then
      local theWindow = theApp:mainWindow()

      if theWindow then
        theWindow:focus()
        return
      end
    end
  end
end

hs.application.enableSpotlightForNameSearches(true)

-- Static application switcher keybinds
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "/", function()
  focusWindow("Microsoft Teams")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "o", function()
  focusWindow("Microsoft Outlook")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "p", function()
  focusWindow("Citrix SSO")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, ".", function()
  focusWindow("com.webex.meetingmanager", "Cisco Webex Meetings")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, ",", function()
  focusWindow("iTerm2")
end)
