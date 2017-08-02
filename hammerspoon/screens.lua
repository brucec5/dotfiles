for screenIndex = 1, 9 do
  hs.hotkey.bind({"ctrl", "alt"}, tostring(screenIndex), function()
    local win = hs.window.focusedWindow()
    local screen = hs.screen.allScreens()[screenIndex]

    win:moveToScreen(screen)
    win:setFrame(screen:frame())
  end)
end

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "s", function()
  for i, screen in ipairs(hs.screen.allScreens()) do
    hs.alert("Screen " .. i, {}, screen)
  end
end)
