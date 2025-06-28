return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")

			local dapui = require("dapui")
			dapui.setup()

			local dap_python = require("dap-python")
			dap_python.setup("uv")

			local virtual_text = require("nvim-dap-virtual-text")
			virtual_text.setup({
				commented = false, -- Show virtual text alongside comment, can be a pain with df's
				show_stop_reason = true,
			})

			-- Keymaps for dap
			vim.keymap.set("n", "<space>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>B", function()
				dap.toggle_breakpoint(vim.fn.input("Breakpoint condition: "))
			end)
			vim.keymap.set("n", "<space>gb", dap.run_to_cursor, { desc = "Run debugger to cursor pos" })
			vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Step into" })
			vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Step over" })
			vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Step out" })
			vim.keymap.set("n", "<F4>", dap.step_back, { desc = "Step back" })

			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start or Continue debugger" })
			vim.keymap.set("n", "<F7>", dap.restart, { desc = "Restart debugger" })
			vim.keymap.set("n", "<F8>", dap.terminate, { desc = "Terminate debugger" })

			-- UI keymaps
			vim.keymap.set("n", "<leader>?", function()
				dapui.eval(nil, { enter = true, desc = "Keymap eval under cursor" })
			end)
			vim.keymap.set("n", "<leader>du", function()
				dapui.toggle()
			end)
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
