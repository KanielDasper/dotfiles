return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		zen = {
			toggles = {
				dim = false,
				git_signs = true,
				mini_diff_signs = false,
				-- diagnostics = false,
				-- inlay_hints = false,
			},
			show = {
				statusline = false, -- can only be shown when using the global statusline
				tabline = false,
			},
		},
	},
	keys = {
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
	},
}
