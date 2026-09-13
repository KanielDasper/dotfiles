vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.cmdheight = 0
vim.opt.pumheight = 10
vim.opt.autoread = true
vim.opt.undofile = true
vim.opt.wrap = false
vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.completeopt = "menuone,noselect,popup"
vim.opt.wildmode = "noselect"
vim.opt.signcolumn = "yes"
vim.opt.clipboard:append("unnamedplus")

vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.nvim", version = "main" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/tpope/vim-surround" },
    { src = "https://github.com/KanielDasper/codepointer.nvim" },
})

local plugins = { "mini.icons", "mini.completion", "mini.pick", "mini.diff", "mini.pairs", "tokyonight", "codepointer" }
for _, value in ipairs(plugins) do
    require(value).setup()
end

require("oil").setup({
    view_options = { show_hidden = true },
    lsp_file_methods = { enabled = true, timeout_ms = 1000, autosave_changes = true },
})

require("conform").setup({
    formatters = {
        ["*"] = { async = true },
    },
    formatters_by_ft = {
        c = { "clang-format" },
        lua = { "stylua" },
        json = { "prettier" },
        toml = { "taplo" },
        html = { "prettier" },
        markdown = { "prettier" },
        python = { "ruff_format" },
        rust = { "rustfmt" },
    },
})

vim.cmd([[colorscheme tokyonight]])
vim.keymap.set({ "n", "v" }, "æ", ":")
vim.keymap.set("n", "U", "<C-R>")
vim.keymap.set("n", "-", "<cmd>Oil<cr>")
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("t", "<Esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<Backspace>", ":nohl<cr>")
vim.keymap.set("n", "<leader>?", "<cmd>e ~/Documents/nvimwiki/index.txt<cr>")
vim.keymap.set("n", "<leader>o", "<cmd>copen<cr>")
vim.keymap.set("n", "<leader>f", "<cmd>Pick files<cr>")
vim.keymap.set("n", "<leader>r", require("conform").format)
vim.keymap.set("n", "<leader>q", require("mini.bufremove").delete)
vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.setqflist()
    vim.cmd("copen")
end, { silent = true })
vim.keymap.set("n", "<leader><leader>", function()
    vim.ui.input({ prompt = "ripgrep: " }, function(pattern)
        if pattern and pattern ~= "" then
            vim.cmd("silent grep! " .. pattern)
            vim.cmd("copen")
        end
    end)
end, { silent = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("CmdlineChanged", {
    pattern = { ":", "/", "?" },
    callback = function()
        vim.fn.wildtrigger()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python", "json", "svelte", "lua", "rust", "markdown", "c", "diff", "typescript", "html" },
    callback = function()
        vim.treesitter.start()
    end,
})

vim.lsp.enable({ "lua_ls", "pyrefly", "ruff", "rust_analyzer", "clangd", "svelte", "ts_ls" })
