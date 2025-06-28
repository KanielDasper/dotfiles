return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				columns = { "icon" },
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				prompt_save_on_select_new_entry = false,
				watch_for_changes = true,
				win_options = {
					concealcursor = "n",
				},
				keymaps = {
					["<C-h>"] = false,
					["<C-l>"] = false,
					["<C-k>"] = false,
					["<C-j>"] = false,
					["<C-i>"] = {
						desc = "Toggle detail view",
						callback = function()
							local oil = require("oil")
							local config = require("oil.config")
							if #config.columns == 1 then
								oil.set_columns({ "icon", "permissions", "size", "mtime" })
							else
								oil.set_columns({ "icon" })
							end
						end,
					},
				},
				view_options = {
					is_always_hidden = function(name, bufnr)
						return name == ".."
					end,
					show_hidden = true,
				},
			})

			-- Open parent directory in current window
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
}
