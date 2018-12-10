hs.hotkey.bind({"ctrl", "alt", "cmd"}, "b", function()
  hs.alert("Killing Blue Coat, TO DEATH!")
  hs.execute(os.getenv("HOME") ..  "/dotfiles/bin/bluekill", true)
end)
