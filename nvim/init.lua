vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<leader>rr", "<cmd>source %<CR>")

require("opts.core")
require("opts.lazy")
require("current-theme")
require("opts.terminalpop")
