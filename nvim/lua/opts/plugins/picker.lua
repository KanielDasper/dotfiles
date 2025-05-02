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
			"<leader>ff",
			function()
				Snacks.picker.smart({
					on_show = function()
						vim.cmd.stopinsert()
					end,
					exclude = { "*.pdf", "*.png" },
				})
			end,
			desc = "Find Files",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({
					cwd = vim.fn.stdpath("config"),
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "Find Config File",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.files({
					cwd = "~/Documents/Vimwiki/",
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "Find Vimwiki File",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.files({
					cwd = "~/.local/share/nvim/lazy",
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "Find Plugin Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep Word",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Grep Selection/Word",
			mode = { "n", "x" },
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.registers({
					on_show = function()
						vim.cmd.stopinsert()
					end,
					layout = "select",
				})
			end,
			desc = "Find Registers",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps({ layout = "select" })
			end,
			desc = "Keymaps Picker",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>fi",
			function()
				Snacks.picker.icons()
			end,
			desc = "Choose icons",
		},
		{
			"<leader>fm",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
	},
}
