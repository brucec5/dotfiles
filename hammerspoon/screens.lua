--local mapping = { 2, 1, 3 }
-- changing this while working from home, since my monitor setup is different
-- TODO: add ability to switch monitor schemes dynamically?
local mapping = { 1, 2 }

for i, screenIndex in ipairs(mapping) do
  hs.hotkey.bind({"ctrl", "alt"}, tostring(i), function()
    local win = hs.window.focusedWindow()
    local screen = hs.screen.allScreens()[screenIndex]

    win:moveToScreen(screen)
    win:setFrame(screen:frame())
  end)
end

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "s", function()
  for i, screen in ipairs(hs.screen.allScreens()) do
    hs.alert("Screen " .. mapping[i], {}, screen)
  end
end)
