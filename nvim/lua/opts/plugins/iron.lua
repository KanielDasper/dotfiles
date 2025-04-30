return {
	"Vigemus/iron.nvim",
	keys = {
		{ "<leader>i", "<cmd>IronRepl<cr>", desc = "Toggle REPL" },
		{ "<leader>I", "<cmd>IronRestart<cr>", desc = "Restart REPL" },
		{ "+", mode = { "n", "x" }, desc = "Send-to-REPL Operator" },
		{ "++", desc = "Send Line to REPL" },
	},
	config = function()
		local iron = require("iron.core")
		iron.setup({
			keymaps = {
				send_line = "++",
				visual_send = "+",
				send_motion = "+",
			},
			config = {
				repl_open_cmd = "vertical botright vsplit",
				repl_definition = {
					python = {
						command = function()
							local ipythonAvailable = vim.fn.executable("ipython") == 1
							local binary = ipythonAvailable and "ipython" or "python3"
							return { binary }
						end,
					},
				},
			},
		})
	end,
}
