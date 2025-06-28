return {
	"rachartier/tiny-code-action.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	event = "LspAttach",
	opts = {
		--- The backend to use, currently only "vim", "delta" and "difftastic" are supported
		--- Only use "delta" if git-delta is installed on the system
		backend = "vim",
		picker = {
			"snacks",
			opts = {
				layout_strategy = "vertical",
				layout_config = {
					preview_cutoff = 1,
					preview_height = function(_, _, max_lines)
						local h = math.floor(max_lines * 0.5)
						return math.max(h, 10)
					end,
				},
			},
		},
		backend_opts = {
			delta = {
				-- Header from delta can be quite large.
				-- You can remove them by setting this to the number of lines to remove
				header_lines_to_remove = 4,
				-- If you have a custom configuration file, you can set the path to it like so:
				-- args = {
				--     "--config" .. os.getenv("HOME") .. "/.config/delta/config.yml",
				-- }
				args = {
					"--line-numbers",
				},
			},
		},
	},
}
