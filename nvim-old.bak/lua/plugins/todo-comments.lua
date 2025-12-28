return {
	-- Quickly Jump through the todo tags
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")
		todo_comments.setup({
			keywords = {
				NOTE = { icon = " ", color = "hint" },
				TODO = { icon = " ", color = "info" },
				WARN = { icon = " ", color = "error" },
				HACK = { icon = " ", color = "warning" },
				TEST = { icon = "󱠄 ", color = "test" },
			},
		})

		vim.keymap.set("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Next todo comment" })

		vim.keymap.set("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Previous todo comment" })
	end,
}
