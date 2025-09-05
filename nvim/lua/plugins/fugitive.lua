return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>g", "<cmd>vert Git<CR>", { desc = "Open Fugitive" })
	end,
}
