return {
	"stevearc/quicker.nvim",
	event = "FileType qf",
	config = function()
		require("quicker").setup({
			opts = {
				buflisted = false,
				number = false,
				relativenumber = false,
				signcolumn = "auto",
				winfixheight = true,
				wrap = false,
			},
			-- Set to false to disable the default options in `opts`
			use_default_opts = true,
			-- Keymaps to set for the quickfix buffer
			keys = {
				{ ">", "<cmd>lua require('quicker').expand()<CR>", desc = "Expand quickfix content" },
				{ "<", "<cmd>lua require('quicker').collapse()<CR>", desc = "Collapse quickfix content" },
			},
			-- Callback function to run any custom logic or keymaps for the quickfix buffer
			edit = {
				-- Enable editing the quickfix like a normal buffer
				enabled = false,
				-- Set to true to write buffers after applying edits.
				-- Set to "unmodified" to only write unmodified buffers.
				autosave = "unmodified",
			},
			-- Keep the cursor to the right of the filename and lnum columns
			constrain_cursor = true,
			highlight = {
				-- Use treesitter highlighting
				treesitter = true,
				-- Use LSP semantic token highlighting
				lsp = true,
				-- Load the referenced buffers to apply more accurate highlights (may be slow)
				load_buffers = false,
			},
			follow = {
				-- When quickfix window is open, scroll to closest item to the cursor
				enabled = false,
			},
			-- How to trim the leading whitespace from results. Can be 'all', 'common', or false
			trim_leading_whitespace = "common",
			-- Maximum width of the filename column
			max_filename_width = function()
				return math.floor(math.min(95, vim.o.columns / 2))
			end,
			-- How far the header should extend to the right
			header_length = function(type, start_col)
				return vim.o.columns - start_col
			end,
		})
	end,

	-- Toggle quickfixlist
	vim.keymap.set("n", "<leader>qq", function()
		require("quicker").toggle({
			focus = true,
		})
	end, {
		desc = "Toggle quickfix",
	}),

	-- Toggle loclist
	vim.keymap.set("n", "<leader>ll", function()
		require("quicker").toggle({ loclist = true, focus = true })
	end, {
		desc = "Toggle loclist",
	}),
}
