return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
					disable = { "help" },
				},
				modules = {},
				indent = { enable = true },

				ignore_install = {},
				auto_install = false,
				sync_install = false,

				ensure_installed = {
					"json",
					"yaml",
					"html",
					"css",
					"python",
					"http",
					"markdown",
					"markdown_inline",
					"graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
					"query",
					"vimdoc",
					"diff",
					"c",
					"regex",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-q>",
						node_incremental = "<C-q>",
						scope_incremental = false,
					},
				},
				additional_vim_regex_highlighting = false,
			})
		end,
	},
}
