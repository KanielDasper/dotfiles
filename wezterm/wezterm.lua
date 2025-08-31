local config = {}
local cool_fonts = { "IosevkaTerm Nerd Font Mono", "MesloLGL Nerd Font Mono", "JetBrainsMono Nerd Font Mono" }
-- local color_schemes = { "Tokyo Night Moon", "Tokyo Night Storm" }
-- local current_colorscheme = color_schemes[math.random(1, #color_schemes)]
local current_colorscheme = "Tokyo Night"

local wezterm = require("wezterm")

-- Window customization
config.window_decorations = "RESIZE"
-- config.macos_window_background_blur = 30
config.window_background_opacity = 0.7

-- Colorscheme
config.color_scheme = current_colorscheme

-- Fonts
config.font = wezterm.font(cool_fonts[3])
config.font_size = 15.0
config.line_height = 1.20

-- General
config.automatically_reload_config = true
config.max_fps = 124
config.animation_fps = 124

-- Connect homebrew path
config.set_environment_variables = {
	PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
}

-- Scrollbar
config.enable_scroll_bar = true
config.scrollback_lines = 10000

-- Padding
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}

-- Window frame config
config.enable_tab_bar = false
-- config.window_frame = {
-- 	font = wezterm.font({ family = cool_fonts[1], weight = "Bold" }),
-- 	font_size = 12,
-- }
-- config.colors = {
-- 	tab_bar = {
-- 		inactive_tab_edge = "#575757",
-- 	},
-- }

-- Enable image processing from kitty
config.enable_kitty_keyboard = true
config.enable_kitty_graphics = true

-- Keybindings
config.keys = {
	-- Open wezterm config with nvim
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
