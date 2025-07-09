return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				css = { "prettier" },
				html = { "prettier" },
				yaml = { "prettier" },
				graphql = { "prettier" },
				markdown = { "prettier" },
				swift = { "swiftformat" },
				json = { "jq" },
				lua = { "stylua" },
				python = { "ruff_format", "ruff_organize_imports" },
				["*"] = { "trim_whitespace", "trim_newlines" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>js", function()
			conform.format({
				lsp_format = "fallback",
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
