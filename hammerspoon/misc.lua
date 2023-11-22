-- hs.hotkey.bind({"ctrl", "alt", "cmd"}, "b", function()
--   hs.alert("Killing Blue Coat, TO DEATH!")
--   hs.execute(os.getenv("HOME") ..  "/dotfiles/bin/bluekill", true)
-- end)

-- Function to strip rich formatting from the paste buffer
-- Important because Teams is awful and doesn't let you disable rich pasting.
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "v", function()
  hs.execute("pbpaste | pbcopy")
end)
