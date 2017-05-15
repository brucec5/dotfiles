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
  hs.execute("/Users/chris.bruce/dotfiles/bin/mpdnotify-mac", true)
end)
