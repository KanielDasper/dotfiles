return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local lint = require("lint")

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			vim.diagnostic.config({ virtual_text = true, underline = true }),
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
		-- vim.keymap.set("n", "<leader>d", function()
		-- 	lint.try_lint()
		-- end, { desc = "Trigger linting for current file" })

		local isLspDiagnosticsVisible = true
		vim.keymap.set("n", "<leader>lx", function()
			isLspDiagnosticsVisible = not isLspDiagnosticsVisible
			vim.diagnostic.config({
				virtual_text = isLspDiagnosticsVisible,
				underline = isLspDiagnosticsVisible,
			})
		end, { desc = "Toggle LSP diagnostics and linter" })
	end,
}
