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

-- Move lines visual
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- wincmd opts
map("n", "<C-w>t", ":tabnew<CR>", { desc = "Open new empty tab" })
map("n", "<C-w>e", ":enew<CR>", { desc = "Open new empty window" })
map("n", "<C-w>Q", ":qa<CR>", { desc = "Quit all open windows" })

-- yanking
map("n", "<leader>y", ":%y+<CR>", { desc = "Yank the whole buffer" })

-- Enter cmd mode - Should not use this bad habit
-- keymap("n", "<C-e>", ":", { desc = "Enter command mode" })
-- keymap("i", "<C-e>", "<Esc>:", { desc = "Enter command mode" })
-- keymap("v", "<C-e>", ":", { desc = "Enter command mode" })
map("n", "<C-f>", "q:i", { desc = "Open command history window" })

-- Escape to normal mode - trying with caps lock tap to esc
map({ "i", "c" }, "jj", "<Esc>", { desc = "Escape to normal mode" })

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

-- Prevent x and d delete from affecting register
map("n", "x", '"_x', { desc = "Don't save deleted text" })
-- keymap("n", "d", '"_d', { desc = "Don't save deleted text" })
-- keymap("v", "p", '"_dp', { desc = "Don't save deleted text" })

-- Undo remap
map("n", "U", "<C-r>", { desc = "Undo" })

-- Clear search highlight
map("n", "<Esc>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- Unmaps Q in normal mode
map("n", "Q", "<nop>", { desc = "Unmaps Q in normal mode" })

-- Save document to word
map("n", "<localleader>w", function()
	local filepath = vim.fn.expand("%:p")
	if filepath == "" then
		vim.ui.input({ prompt = "Enter filename for unsaved buffer (with extension): " }, function(input)
			if input and input ~= "" then
				vim.cmd("write " .. input)
				local name = vim.fn.fnamemodify(input, ":t:r")
				vim.cmd("!pandoc -o " .. name .. ".docx " .. input)
			else
				print("No filename provided. Aborting.")
			end
		end)
	else
		local name = vim.fn.fnamemodify(filepath, ":t:r")
		vim.cmd("write")
		vim.cmd("!pandoc -o " .. name .. ".docx " .. filepath .. " -f markdown-smart -t docx")
	end
end, { desc = "Save and export to Word" })

-- Toggeable diff between two open windows
map("n", "<leader>dt", function()
	local is_diff = vim.wo.diff
	if is_diff then
		vim.cmd("windo diffoff")
	else
		vim.cmd("windo diffthis")
	end
end, { desc = "Toggle diffview with window" })

-- Copy filepath to the clipboard
map("n", "<localleader>dd", function()
	local filePath = vim.fn.expand("%:p")
	vim.fn.setreg("+", filePath)
	print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })

map("n", "<localleader>d", ":echo getcwd()<cr>", { desc = "Echo current working directory" })
