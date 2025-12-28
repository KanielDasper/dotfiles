local exlcude_files = { "*.pdf", "*.png" }

return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		picker = {
			enabled = true,
			hidden = true,
			prompt = " 󰁕 ",
			formatters = {
				file = { filename_first = false, filename_only = false, icon_width = 2 },
			},
			layout = {
				cycle = true,
				--- Use the default layout or vertical if the window is too narrow
				preset = function()
					return vim.o.columns >= 120 and "default" or "vertical"
				end,
			},
		},
	},
	keys = {
		{
			"<leader>f",
			function()
				Snacks.picker.files({
					exclude = exlcude_files,
				})
			end,
			desc = "Find Files",
		},
		{
			"<leader>.",
			function()
				Snacks.picker.files({
					cwd = vim.fn.stdpath("config"),
				})
			end,
			desc = "Find Config File",
		},
		{
			"<leader>W",
			function()
				Snacks.picker.grep({
					cwd = "~/Documents/Vimwiki/",
				})
			end,
			desc = "Find Vimwiki File",
		},
		{
			"<leader>r",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep Word",
		},
		{
			"<leader>h",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader><leader>",
			function()
				Snacks.picker.buffers({ layout = "select" })
			end,
			desc = "Buffers",
		},
	},
}
