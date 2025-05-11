-- Init wezterm config table
local wezterm = require("wezterm")
local appearance = require("appearance")

-- Config table
local config = {}
local cool_fonts = { "IosevkaTerm Nerd Font Mono", "MesloLG Nerd Font Mono" }

-- Window customization
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
-- config.macos_window_background_blur = 30
-- config.window_background_opacity = 0.7

-- Fonts
config.font = wezterm.font(cool_fonts[1])
config.font_size = 16.0
config.line_height = 1.50

-- General
config.automatically_reload_config = true
config.max_fps = 120
config.animation_fps = 120

-- colorscheme from require("appearance")
if appearance.is_dark() then
	config.color_scheme = "Tokyo Night Moon"
else
	config.color_scheme = "Tokyo Night Day"
end

-- Connect homebrew path
config.set_environment_variables = {
	PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
}

-- Scrollbar
config.enable_scroll_bar = true
config.scrollback_lines = 3500

-- Padding
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}

-- Window frame config
config.window_frame = {
	font = wezterm.font({ family = cool_fonts[1], weight = "Bold" }),
	font_size = 12,
}
config.colors = {
	tab_bar = {
		inactive_tab_edge = "#575757",
	},
}

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
