---@diagnostic disable-next-line: lowercase-global
hs = hs -- hs (lowercase) is hammerspoon API entry point -> LSP should ignore diagnostics

-- Reload config
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "h", function()
	hs.reload()
	hs.notify.new({ title = "Hammerspoon" , informativeText="Config reloaded!"}):send()
end)

require("plugin.toggleFnKeys")
require("plugin.mappings")
require("plugin.ctrl-esc")
-- hs.loadSpoon("cmdMate")
