return {
	"echaya/neowiki.nvim",
	opts = {
		wiki_dirs = {
			-- neowiki.nvim supports both absolute and tilde-expanded paths
			{ name = "Personal", path = "~/Documents/Vimwiki" },
		},
		floating_wiki = {
			open = {
				relative = "editor",
				width = 0.6,
				height = 0.6,
				border = "rounded",
			},
		},
		keymaps = {
			navigate_back = "<Backspace>",
			jump_to_index = "<Esc>",
		},
	},
	keys = {
		-- See https://github.com/echaya/neowiki.nvim for more keymaps
		-- { "<leader>ww", "<cmd>lua require('neowiki').open_wiki_floating()<cr>", desc = "Open Wiki in Floating Window" },
		{ "<leader>W", "<cmd>lua require('neowiki').open_wiki()<cr>", desc = "Open Wiki" },
		-- { "<leader>wT", "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>", desc = "Open Wiki in Tab" },
	},
}
