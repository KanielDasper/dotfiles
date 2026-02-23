local config = {}
local cool_fonts = { "IosevkaTerm Nerd Font Mono", "JetBrainsMono Nerd Font Mono", "Fira Code", "Ubuntu Nerd Font" }
local current_colorscheme = "Tokyo Night Storm"

local wezterm = require("wezterm")
config.set_environment_variables = {
	PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
}
config.color_scheme = current_colorscheme
config.window_decorations = "RESIZE"
config.font = wezterm.font(cool_fonts[3])
config.font_size = 17.0
config.line_height = 1.20
config.automatically_reload_config = true
config.max_fps = 124
config.animation_fps = 124
config.enable_scroll_bar = true
config.scrollback_lines = 10000
-- config.window_padding = {
-- 	left = 2,
-- 	right = 2,
-- 	top = 5,
-- 	bottom = 5,
-- }
config.enable_tab_bar = false
config.keys = {
	{
		key = ",",
		mods = "SUPER",
		action = wezterm.action.SplitHorizontal({
			cwd = wezterm.home_dir,
			args = { "nvim", wezterm.config_file },
		}),
	},
}

return config
