return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		focus = true,
	},
	cmd = "Trouble",
	keys = {
		-- None LSP-dependent keymaps
		{ "<leader>xs", "<cmd>Trouble symbols toggle<CR>", desc = "Open trouble quickfix list" },
		{
			"<leader>xl",
			"<cmd>Trouble lsp toggle fold_close_all win = {focus=false, position=right}<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
	},
}
