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
						sql = { "lsp", "snippets", "dadbod", "buffer" },
					},
					providers = {
						dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
					},
				},
			},
		},
	},
	-- HACK: To add a database file: Use add database connection
	-- if its sqlite3 --> sqlite:mydatabase.sqlite3
	init = function()
		vim.keymap.set("n", "<localleader>db", "<Cmd>DBUIToggle<CR>", { desc = "Dad[B]od UI", silent = true })
		-- DBUI configuration can be put here
		-- See: https://github.com/kristijanhusak/vim-dadbod-ui
		-- TODO: Add DB helper snippets and saved database connections
		vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"

		vim.keymap.set("n", "<localleader>db", "<Cmd>DBUIToggle<CR>", { desc = "Toggle Dadbod UI", silent = true })
	end,
}
