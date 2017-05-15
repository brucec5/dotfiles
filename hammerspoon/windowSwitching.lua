-- Static application switcher keybinds
hs.hotkey.bind({"cmd", "ctrl"}, "/", function()
  hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind({"cmd", "ctrl"}, "l", function()
  hs.execute("/Users/chris.bruce/bin/lockscreen")
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
