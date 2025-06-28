-- quickfix navigation
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.keymap.set("n", "<C-n>", ":cnext<CR><C-W>p", { buffer = true, silent = true })
		vim.keymap.set("n", "<C-p>", ":cprev<CR><C-W>p", { buffer = true, silent = true })
	end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Open help in new buffer and list it in the buffer menu
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = function(event)
		if vim.bo[event.buf].filetype == "help" then
			vim.bo[event.buf].buflisted = true
			vim.cmd.only()
		end
	end,
})

local numbertoggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

vim.api.nvim_create_autocmd({ "InsertEnter", "FocusLost", "BufLeave", "WinLeave", "CmdlineEnter" }, {
	group = numbertoggle,
	callback = function()
		if vim.wo.number then
			vim.wo.relativenumber = false
		end
	end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "FocusGained", "BufEnter", "WinEnter", "CmdlineLeave" }, {
	group = numbertoggle,
	callback = function()
		if vim.wo.number then
			vim.wo.relativenumber = true
		end
	end,
})

-- Oil supports lsp renaming with snacks
vim.api.nvim_create_autocmd("User", {
	pattern = "OilActionsPost",
	callback = function(event)
		if event.data.actions.type == "move" then
			Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
		end
	end,
})
