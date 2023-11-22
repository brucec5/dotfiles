hs.hotkey.bind({"cmd"}, "f7", function()
  hs.execute("/usr/local/bin/mpc prev")
end)

hs.hotkey.bind({"cmd"}, "f8", function()
  hs.execute("/usr/local/bin/mpc toggle")
end)

hs.hotkey.bind({"cmd"}, "f9", function()
  hs.execute("/usr/local/bin/mpc next")
end)

hs.hotkey.bind({"cmd", "shift"}, "f8", function()
  hs.execute(os.getenv("HOME") ..  "/dotfiles/bin/mpdnotify-mac status", true)
end)

hs.hotkey.bind({"cmd", "ctrl", "alt"}, "p", function()
  -- TODO: do this with the hammerspoon choose plugin, which should speed things up
  hs.execute(os.getenv("HOME") ..  "/bin/mpc-choose", true)
end)
