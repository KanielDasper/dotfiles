---@diagnostic disable-next-line: lowercase-global
hs = hs -- hs (lowercase) is hammerspoon API entry point -> LSP should ignore diagnostics

-- Reload config
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "h", function()
	hs.reload()
end)
hs.alert.show("Config reloaded...")

-- require  files
-- TODO: Make into spoons?
-- require("plugin.toggleFnKeys")
require("plugin.mappings")
require("plugin.ctrl-esc")

-- hs.loadSpoon("cmdMate")
