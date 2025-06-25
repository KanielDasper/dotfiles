return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "Snacks" },
			},
			completion = {
				callSnippet = "Replace",
			},
			workspace = {
				library = {
					--NOTE:
					-- 3rd refers to predefined 3rd party plugins supported by lua_ls
					-- see: https://github.com/LuaLS/lua-language-server/tree/47b3a56c5f6a2bff29f60f7f1bce95e40b3ff5a2/meta/3rd
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
					-- ["${3rd}/love2d/library"] = true,
				},
			},
		},
	},
}
