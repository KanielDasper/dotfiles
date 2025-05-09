local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Stolen from TJ Devries
-- gj and gk except for when jumping lines with numbers
keymap({ "n", "v" }, "j", function()
	local count = vim.v.count

	if count == 0 then
		return "gj"
	else
		return "j"
	end
end, { expr = true })

keymap({ "n", "v" }, "k", function()
	local count = vim.v.count

	if count == 0 then
		return "gk"
	else
		return "k"
	end
end, { expr = true })

keymap("n", "<leader>rr", ":w<cr><cmd>luafile %<cr>", { desc = "Save and Run luafile" })

-- Move lines visual
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- wincmd opts
keymap("n", "<C-w>t", ":tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<C-w>e", ":enew<CR>", { desc = "Open new buffer" })

-- yanking
keymap("n", "<leader>y", ":%y+<CR>", { desc = "Yank the whole buffer" })

-- Enter cmd mode
keymap("n", "<C-e>", ":", { desc = "Enter command mode" })
keymap("i", "<C-e>", "<Esc>:", { desc = "Enter command mode" })
keymap("v", "<C-e>", ":", { desc = "Enter command mode" })

-- Escape to normal mode
keymap({ "i", "c" }, "jj", "<Esc>", { desc = "Escape to normal mode" })

-- QoL center screen with zz
keymap("n", "J", "mzJ`z")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

-- Easier indentation in normal and visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n", "<", "<<g", opts)
keymap("n", ">", ">>g", opts)

-- Resize panes
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Prevent x and d delete from affecting register
keymap("n", "x", '"_x', { desc = "Don't save deleted text" })
keymap("n", "d", '"_d', { desc = "Don't save deleted text" })
keymap("v", "p", '"_dp', { desc = "Don't save deleted text" })

-- Undo remap
keymap("n", "U", "<C-r>", { desc = "Undo" })

-- Clear search highlight
keymap("n", "<Esc>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- Unmaps Q in normal mode
keymap("n", "Q", "<nop>", { desc = "Unmaps Q in normal mode" })

-- Save document to word
keymap("n", "<localleader>w", function()
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
		vim.cmd("!pandoc -o " .. name .. ".docx " .. filepath)
	end
end, { desc = "Save and export to Word" })

-- Toggeable diff between two open windows
keymap("n", "<leader>dt", function()
	local is_diff = vim.wo.diff
	if is_diff then
		vim.cmd("windo diffoff")
	else
		vim.cmd("windo diffthis")
	end
end, { desc = "Toggle diffview with window" })

-- Copy filepath to the clipboard
keymap("n", "<localleader>dd", function()
	local filePath = vim.fn.expand("%:p")
	vim.fn.setreg("+", filePath)
	print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })

keymap("n", "<localleader>d", ":echo getcwd()<cr>", { desc = "Echo current working directory" })
