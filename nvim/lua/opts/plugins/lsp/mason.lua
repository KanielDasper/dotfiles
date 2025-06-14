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

		--NOTE: LSPs are configured in lspconfig.lua

		-- local mason_lspconfig = require("mason-lspconfig")
		-- mason_lspconfig.setup({
		-- 	-- servers for mason to install
		-- 	ensure_installed = {
		-- 		"lua_ls",
		-- 		"ruff",
		-- 		"pyright",
		-- 		"jsonls",
		-- 	},
		-- auto install configured servers (with lspconfig)
		-- 	automatic_installation = true,
		-- })

		mason_tool_installer.setup({
			ensure_installed = {
				-- LSPs
				"lua_ls",
				"ruff",
				"pyright",
				"jsonls",
				-- Formatters and linters
				"prettier", -- prettier formatter
				"jq", -- json formatter
				"stylua", -- lua formatter
				"markdownlint", -- markdown linter and formatter
				"ruff", -- python linter + formatter
				"jsonlint", -- json linter
			},
		})
	end,
}
