local option = vim.opt
vim.cmd("let g:netrw_banner = 0 ")

option.guicursor = ""
option.number = true
option.relativenumber = true

option.tabstop = 4
option.softtabstop = 4
option.shiftwidth = 4
option.expandtab = true
option.smartindent = true

-- Can be toggled with snacks.nvim
option.wrap = true
option.cursorline = false

option.swapfile = false
option.backup = false
option.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
option.undofile = true

option.inccommand = "split"

option.ignorecase = true
option.smartcase = true

option.termguicolors = true
option.background = "dark"

option.scrolloff = 15

-- Enable folding ( setup in lsp-config )
option.foldenable = true -- Enable folding by default
option.foldlevel = 99 -- Open most folds by default
option.foldcolumn = "0"
option.signcolumn = "yes:1"

--split windows
option.splitright = true --split vertical window to the right
option.splitbelow = true --split horizontal window to the bottom

option.isfname:append("@-@")
option.updatetime = 50

-- clipboard
option.clipboard:append("unnamedplus") --use system clipboard as default

-- for easy mouse resizing, just incase
option.mouse = "a"

option.fillchars = {
	diff = "╱",
}

option.diffopt = {
	"internal",
	"filler",
	"closeoff",
	"context:12",
	"algorithm:histogram",
	"linematch:200",
	"indent-heuristic",
}
