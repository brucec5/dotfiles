local mapping = { 2, 1, 3 }

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
