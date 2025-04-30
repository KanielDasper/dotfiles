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

-- Save to registers 1 - 9 on yank
vim.cmd([[
function! YankShift()
  for i in range(9, 1, -1)
    call setreg(i, getreg(i - 1))
  endfor
endfunction

au TextYankPost * if v:event.operator == 'y' | call YankShift() | endif
]])
