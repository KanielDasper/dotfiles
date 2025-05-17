-- line numbers
vim.o.number = true
vim.o.relativenumber = true

-- tab and shift width
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.breakindent = true -- Preserve indentation

-- Can be toggled with snacks.nvim
vim.o.wrap = true
vim.o.cursorline = false

-- Backup files for buffers, only use undo
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("data")

vim.o.inccommand = "split"

-- better cmdline search
vim.o.ignorecase = true
vim.o.smartcase = true

-- For colorschemes, i like it dark
vim.o.termguicolors = true
vim.o.background = "dark"

-- When window should begin to scroll (99 for centered)
vim.o.scrolloff = 99

-- Enable folding ( setup in lsp-config )
vim.o.foldenable = true -- Enable folding by default
vim.o.foldlevel = 99 -- Open most folds by default
vim.o.foldcolumn = "0"

-- Give the column some space
vim.o.signcolumn = "yes:1"

--split windows
vim.o.splitright = true --split vertical window to the right
vim.o.splitbelow = true --split horizontal window to the bottom
vim.o.laststatus = 3 -- Preserve 1 statusline on split

-- How fast should vim update
vim.o.updatetime = 50

-- clipboard
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- for easy mouse resizing, just incase
vim.o.mouse = "a"

-- Table opts for diffview in nvim, this makes it look like vscode
vim.opt.fillchars = {
	diff = "╱",
}
vim.opt.diffopt = {
	"internal",
	"filler",
	"closeoff",
	"context:12",
	"algorithm:histogram",
	"linematch:200",
	"indent-heuristic",
}
