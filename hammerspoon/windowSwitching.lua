function focusWindow(appName)
  local theApp = hs.application.get(appName)
  if theApp then
    local theWindow = theApp:mainWindow()

    if theWindow then
      theWindow:focus()
    end
  end
end

-- Static application switcher keybinds
hs.hotkey.bind({"cmd", "ctrl"}, "/", function()
  focusWindow("Slack")
end)

-- Application Switcher
switcher = hs.window.switcher.new()

hs.hotkey.bind(
  {"alt"},
  "tab",function() switcher:next() end,
  nil,
  function() switcher:next() end
)

hs.hotkey.bind(
  {"alt", "shift"},
  "tab",function() switcher:previous() end,
  nil,
  function() switcher:previous() end
)

-- Hints
hs.hints.showTitleThresh = 10
hs.hints.style = "vimperator"

hs.hotkey.bind({"cmd"}, "escape", function()
  hs.hints.windowHints()
end)

-- Hints for focused window's application
hs.hotkey.bind({"alt"}, "escape", function()
  hs.hints.windowHints(
    hs.window.focusedWindow():application():allWindows()
  )
end)
