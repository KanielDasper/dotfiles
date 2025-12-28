return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		-- import mason and mason_lspconfig
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- LSPs
				"lua_ls",
				"ruff",
				"basedpyright",
				"jsonls",

				-- Formatters and linters
				"ruff",
				"prettier",
				"swiftlint",
				"jq",
				"stylua",
				"markdownlint",
				"jsonlint",
			},
		})
	end,
}
