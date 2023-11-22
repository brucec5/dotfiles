local emailFilePath = os.getenv("HOME") .. "/.config/email-address"
local emailFile = io.open(emailFilePath, "r")
local logger = hs.logger.new("keyboardInput", "info")

if emailFile then
  logger.i("Found " .. emailFilePath .. ", about to read")
  local email = emailFile:read("*all"):gsub("%s+", "")
  emailFile:close()

  -- Based on the contents of emailFile, enter that in as keystrokes.
  hs.hotkey.bind({"ctrl", "alt", "cmd"}, "e", function()
    hs.eventtap.keyStrokes(email)
  end)
else
  logger.i("Could not find " .. emailFilePath)
end

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "p", function()
  paste = hs.pasteboard.getContents()
  if paste == nil then
    hs.alert.show("Error grabbing paste data for some reason")
  else
    hs.eventtap.keyStrokes(paste)
  end
end)
