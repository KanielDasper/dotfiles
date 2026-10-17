vim.opt.number = true
vim.opt.laststatus = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.grepprg = "rg --vimgrep"
vim.api.nvim_create_autocmd("QuickFixCmdPost", { pattern = "grep", command = "copen" })
vim.opt.path:append("src/**,lua/**,static/")
vim.opt.wildignore:append("*/__pycache__/*,*/node_modules/*")
vim.opt.clipboard:append("unnamedplus")
vim.cmd.colorscheme({ "industry" })
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-mini/mini.completion",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/tpope/vim-fugitive",
})

vim.keymap.set("n", "grd", vim.lsp.buf.definition)
vim.keymap.set("n", "grf", vim.lsp.buf.format)
vim.keymap.set("n", "-", require("oil").open)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<C-f>", ":find ")
vim.keymap.set("n", "<C-g>", ":silent grep -e ")

vim.lsp.enable({
  "lua_ls",
  "svelte",
  "tsc",
  "jdtls",
  "jsonls",
  "tombi",
  "pyrefly",
  "ruff",
})

require("mini.completion").setup()
require("oil").setup({ view_options = { show_hidden = true } })
