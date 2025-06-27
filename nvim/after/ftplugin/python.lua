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
