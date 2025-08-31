return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>g", "<cmd>Git<CR>", { desc = "Open Fugitive" })
	end,
}
