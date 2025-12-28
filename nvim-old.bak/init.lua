vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("config.lazy")
require("config.core")
require("lsp")
require("float_term")

vim.cmd("colorscheme tokyonight-moon")
require("maker").setup()
