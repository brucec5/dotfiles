-- Static application switcher keybinds
hs.hotkey.bind({"cmd", "ctrl"}, "/", function()
  local slackApp = hs.application.get('Slack')
  if slackApp then
    local slackWindow = slackApp:mainWindow()

    if slackWindow then
      slackWindow:focus()
    end
  end
end)

hs.hotkey.bind({"cmd", "ctrl"}, "l", function()
  hs.execute(os.getenv("HOME") .. "/bin/lockscreen")
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
