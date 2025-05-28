-- Python specific indentations
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true

local function iabbrev(lhs, rhs)
	vim.keymap.set("ia", lhs, rhs, { buffer = true })
end

-- Python specific abbreviations
iabbrev("true", "True")
iabbrev("false", "False")
iabbrev("--", "#")
iabbrev("null", "None")
iabbrev("none", "None")
iabbrev("nil", "None")
iabbrev("function", "def")
