return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		{
			"folke/lazydev.nvim",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		-- Import completion capabilities from blink.cmp
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		-- Diagnostic signs
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})

		vim.o.foldmethod = "expr"
		-- Default to treesitter folding
		vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		-- Prefer LSP folding if client supports it
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client:supports_method("textDocument/foldingRange") then
					local win = vim.api.nvim_get_current_win()
					vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
				end
			end,
		})

		-- Autocmd for keymaps when LSP is active
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings
				-- Check `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }
				local keymap = vim.keymap.set

				opts.desc = "Go to LSP references in buffer"
				keymap("n", "grr", "<cmd>Trouble lsp_references toggle filter.buf=0<CR>", opts)

				opts.desc = "Go to LSP references"
				keymap("n", "gR", "<cmd>Trouble lsp_references toggle<CR>", opts)

				opts.desc = "Go to declaration"
				keymap("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP diagnostics"
				keymap("n", "<leader>dd", "<cmd>Trouble diagnostics filter.buf=0<CR>", opts)

				opts.desc = "Show LSP workspace diagnostics"
				keymap("n", "<leader>xx", "<cmd>Trouble diagnostics<CR>", opts)

				opts.desc = "Show LSP definitions"
				keymap("n", "gd", "<cmd>Trouble lsp_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				keymap("n", "gi", "<cmd>Trouble lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				keymap("n", "gT", "<cmd>Trouble lsp_type_definitions<CR>", opts)

				opts.desc = "Show available code actions"
				vim.keymap.set("n", "<leader>ca", function()
					require("tiny-code-action").code_action()
				end, { noremap = true, silent = true })

				opts.desc = "LSP intelligent rename symbol"
				keymap("n", "grn", vim.lsp.buf.rename, opts)

				opts.desc = "Show documentation on hover"
				keymap("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP server"
				keymap("n", "<leader>rs", ":LspRestart<CR>", opts)

				keymap("n", "grh", function()
					vim.lsp.buf.signature_help()
				end, opts)
			end,
		})

		-- Configure lua
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "Snacks" },
					},
					completion = {
						callSnippet = "Replace",
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- Configure pyright
		lspconfig.pyright.setup({
			capabilities = capabilities,
			settings = {
				pyright = {
					-- Using Ruff's import organizer
					disableOrganizeImports = true,
				},
				python = {
					analysis = {
						-- Ignore all files for analysis to exclusively use Ruff for linting
						ignore = { "*" },
					},
				},
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client == nil then
					return
				end
				if client.name == "ruff" then
					-- Disable hover in favor of Pyright
					client.server_capabilities.hoverProvider = false
				end
			end,
			desc = "LSP: Disable hover capability from Ruff",
		})

		-- configure Ruff
		lspconfig.ruff.setup({
			init_options = {
				settings = {
					logLevel = "info",
					logFile = "~/.local/state/nvim/ruff.log",
					format = {
						preview = true,
					},
				},
			},
		})
	end,
}
