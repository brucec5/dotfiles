function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end

watcher = hs.pathwatcher.new(
  os.getenv("HOME") .. "/.hammerspoon/",
  reloadConfig
):start()

hs.hotkey.bind({"cmd", "ctrl", "alt", "shift"}, "r", function() hs.relaunch() end)
hs.hotkey.bind({"cmd", "ctrl", "alt"}, "r", function() hs.reload() end)

hs.alert.show("Hammerspoon Config Loaded!")
