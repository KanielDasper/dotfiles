vim.g.mapleader = " "
vim.g.netrw_banner = 0
vim.opt.laststatus = 2
vim.opt.number = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.clipboard:append("unnamedplus")
vim.cmd.colorscheme({ "catppuccin" })
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-mini/mini.completion",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/KanielDasper/codepointer.nvim",
})

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>.", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>p", require("codepointer").set_codepointer_to_register)
vim.keymap.set("n", "<leader>f", require("fzf-lua").files)
vim.keymap.set("n", "<leader>g", require("fzf-lua").live_grep)

vim.lsp.enable({
  "lua_ls",
  "tsc",
  "jdtls",
  "pyrefly",
  "ruff",
})

require("mini.completion").setup()
require("fzf-lua").setup({ "telescope" })
