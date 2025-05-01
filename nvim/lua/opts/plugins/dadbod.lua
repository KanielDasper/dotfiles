return {
	"tpope/vim-dadbod",
	dependencies = {
		"kristijanhusak/vim-dadbod-ui",
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		{
			"saghen/blink.cmp",
			opts = {
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
					per_filetype = {
						sql = { "snippets", "dadbod", "buffer" },
					},
					providers = {
						dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
					},
				},
			},
		},
	},
	init = function()
		vim.keymap.set("n", "<localleader>db", "<Cmd>DBUIToggle<CR>", { desc = "Dad[B]od UI", silent = true })
		-- DBUI configuration can be put here
		-- See: https://github.com/kristijanhusak/vim-dadbod-ui
		-- TODO: Add DB helper snippets and saved database connections
	end,
}
