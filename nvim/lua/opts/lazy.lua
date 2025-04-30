local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "opts.plugins" },
	{ import = "opts.plugins.lsp" },
}, {
	install = {
		colorscheme = { "tokyonight" },
	},
	ui = {
		border = "rounded",
	},
	checker = {
		enabled = false,
		notify = true,
	},
	change_detection = {
		notify = false,
	},
	performance = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	rocks = {
		-- Luarocks support disabled
		enabled = false,
	},
	custom_keys = {
		-- Local keymaps for the :Lazy dashboard
		["<localleader>l"] = {
			function(plugin)
				require("lazy.util").float_term({ "lazygit", "log" }, {
					cwd = plugin.dir,
				})
			end,
			desc = "Open lazygit log",
		},
		["<localleader>i"] = {
			function(plugin)
				Util.notify(vim.inspect(plugin), {
					title = "Inspect " .. plugin.name,
					lang = "lua",
				})
			end,
			desc = "Inspect Plugin",
		},
	},
})
