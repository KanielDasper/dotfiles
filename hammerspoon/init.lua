-- Hammerspoon config file
hs = hs

-- require directory files
require("remap")
require("app_hotkey")
require("toggle_fn_keys")
hs.loadSpoon("cmdMate")

-- Reload config
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "h", function()
	hs.reload()
end)
hs.alert.show("Config reloaded...")
