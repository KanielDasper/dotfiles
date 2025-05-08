-- Hammerspoon config file
hs = hs

-- Reload config
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "h", function()
	hs.reload()
end)
hs.alert.show("Config reloaded...")

-- require  files
require("config.remap")
require("config.toggleFnKeys")
require("config.appHotkey")

hs.loadSpoon("cmdMate")
