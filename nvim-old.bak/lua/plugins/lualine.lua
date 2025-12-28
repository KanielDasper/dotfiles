return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local statusbar = require("lualine")
		statusbar.setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = {},
				section_separators = {},
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = true,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"filename",
				},
				lualine_c = {
					"branch",
					"diff",
					"diagnostics",
					{
						"lsp_status",
						icon = "", -- f013
						symbols = {
							-- Standard unicode symbols to cycle through for LSP progress:
							spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
							-- Standard unicode symbol for when LSP is done:
							done = "✓",
							-- Delimiter inserted between LSP names:
							separator = " ",
						},
					},
				},
				lualine_x = {
					"encoding",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			-- inactive_sections = {
			-- 	lualine_a = {},
			-- 	lualine_b = {},
			-- 	lualine_c = { "filename" },
			-- 	lualine_x = { "location" },
			-- 	lualine_y = {},
			-- 	lualine_z = {},
			-- },
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
