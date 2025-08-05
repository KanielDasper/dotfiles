local map = vim.keymap.set

-- Stolen from TJ Devries
-- gj and gk except for when jumping lines with numbers
map({ "n", "v" }, "j", function()
	local count = vim.v.count

	if count == 0 then
		return "gj"
	else
		return "j"
	end
end, { expr = true })

map({ "n", "v" }, "k", function()
	local count = vim.v.count

	if count == 0 then
		return "gk"
	else
		return "k"
	end
end, { expr = true })

map("n", "<leader>rr", ":w<cr><cmd>luafile %<cr>", { desc = "Save and Run luafile" })
map("n", "<leader>lg", "<cmd>Git<cr>", { desc = "Open Fugitive" })

-- Move lines visual
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- wincmd opts
map("n", "<C-w>t", ":tabnew<CR>", { desc = "Open new empty tab" })
map("n", "<C-w>e", ":enew<CR>", { desc = "Open new empty window" })
map("n", "<C-w>Q", ":qa<CR>", { desc = "Quit all open windows" })

-- yanking
map("n", "<leader>y", ":%y+<CR>", { desc = "Yank the whole buffer" })

-- QoL center screen with zz
map("n", "J", "mzJ`z")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

-- Easier indentation in normal and visual mode
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })
map("n", "<", "<<g", { noremap = true, silent = true })
map("n", ">", ">>g", { noremap = true, silent = true })

-- Prevent x delete from affecting register
map("n", "x", '"_x', { desc = "Don't save deleted text" })

-- Undo remap
map("n", "U", "<C-r>", { desc = "Undo" })

-- Clear search highlight
map("n", "<Esc>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- Copy filepath to the clipboard
map("n", "<localleader>d", function()
	local filePath = vim.fn.expand("%:p")
	vim.fn.setreg("+", filePath)
	print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })
