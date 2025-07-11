return {
	"bassamsdata/namu.nvim",
	opts = {
		global = {},
		namu_symbols = { -- Specific Module options
			options = {},
		},
	},
	vim.keymap.set("n", "<leader>sw", ":Namu watchtower<cr>", {
		desc = "Jump to LSP symbol",
		silent = true,
	}),
}
