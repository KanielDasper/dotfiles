return {
	"echaya/neowiki.nvim",
	opts = {
		wiki_dirs = {
			-- neowiki.nvim supports both absolute and tilde-expanded paths
			{ name = "Personal", path = "~/Documents/Vimwiki" },
		},
		keymaps = {
			navigate_back = "<Backspace>",
			jump_to_index = "<C-æ>",
		},
	},
	keys = {
		-- See https://github.com/echaya/neowiki.nvim for more keymaps
		{ "<leader>w", "<cmd>lua require('neowiki').open_wiki()<cr>", desc = "Open Wiki" },
	},
}
