vim.lsp.enable({
	"lua_ls",
	"basedpyright",
	"jsonls",
	"sourcekit",
	"ts_ls",
	-- "ruff",
})

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("blink.cmp").get_lsp_capabilities()

-- All lsp's should have completion capabilities and use .git as rootmarkers
vim.lsp.config("*", {
	capabilities = capabilities,
	root_markers = { ".git" },
})

vim.diagnostic.config({
	-- virtual_lines = true,
	virtual_text = true,
	update_in_insert = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(event)
		-- Check `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = event.buf, silent = true }

		-- Fold from lsp
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client:supports_method("textDocument/foldingRange") then
			local win = vim.api.nvim_get_current_win()
			vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
		end

		opts.desc = "Go to LSP references in buffer"
		vim.keymap.set("n", "grr", "<cmd>Trouble lsp_references toggle filter.buf=0<CR>", opts)

		opts.desc = "Go to LSP references"
		vim.keymap.set("n", "gR", "<cmd>Trouble lsp_references toggle<CR>", opts)

		opts.desc = "Go to declaration"
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		opts.desc = "Show LSP diagnostics"
		vim.keymap.set("n", "<leader>dd", "<cmd>Trouble diagnostics filter.buf=0<CR>", opts)

		opts.desc = "Show LSP workspace diagnostics"
		vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", opts)

		opts.desc = "Show LSP definitions"
		vim.keymap.set("n", "gD", "<cmd>Trouble lsp_definitions<CR>", opts)

		opts.desc = "Show LSP implementations"
		vim.keymap.set("n", "gri", "<cmd>Trouble lsp_implementations<CR>", opts)

		opts.desc = "Show LSP type definitions"
		vim.keymap.set("n", "grt", "<cmd>Trouble lsp_type_definitions<CR>", opts)

		opts.desc = "Show available code actions"
		vim.keymap.set("n", "gra", vim.lsp.buf.code_action, opts)

		opts.desc = "LSP intelligent rename symbol"
		vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)

		opts.desc = "LSP document symbol"
		vim.keymap.set("n", "gO", "<cmd>Trouble lsp_document_symbols<CR>", opts)

		opts.desc = "Show documentation on hover"
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, opts)

		vim.keymap.set("i", "<C-i>", function()
			vim.lsp.buf.signature_help({ border = "rounded" })
		end, opts)
	end,
})
