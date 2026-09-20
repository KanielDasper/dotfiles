vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.autoread = true
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.pumheight = 10
vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"
vim.opt.laststatus = 2
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "0"
vim.opt.shortmess:append("c")
vim.opt.clipboard:append("unnamedplus")
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

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
vim.keymap.set("n", "<leader>v", "<cmd>Gvdiffsplit<cr>")
vim.keymap.set("n", "<leader>r", require("conform").format)
vim.keymap.set("n", "<leader>q", require("mini.bufremove").delete)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

local plugins = {
    "tokyonight",
    "codepointer",
    "mini.icons",
    "mini.cmdline",
    "mini.completion",
    "mini.pick",
    "mini.pairs",
}
for _, value in ipairs(plugins) do
    require(value).setup()
end
require("vim._core.ui2").enable()
require("mini.diff").setup({
    source = require("mini.diff").gen_source.git({ index = false }),
})
require("oil").setup({
    view_options = { show_hidden = true },
    lsp_file_methods = { enabled = true, timeout_ms = 1000, autosave_changes = true },
})
require("conform").setup({
    formatters_by_ft = {
        python = { "ruff_format" },
        rust = { "rustfmt" },
        lua = { "stylua" },
        json = { "prettier" },
        toml = { "taplo" },
        html = { "prettier" },
        markdown = { "prettier" },
    },
})
vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.keymap.set("n", "<leader><leader>", function()
    vim.ui.input({ prompt = "ripgrep: " }, function(pattern)
        if pattern and pattern ~= "" then
            vim.cmd("silent grep! " .. pattern)
            vim.cmd("copen")
        end
    end)
end, { silent = true })

local ensure_installed = {
    "python",
    "rust",
    "svelte",
    "bash",
    "diff",
    "json",
    "typescript",
    "javascript",
    "html",
    "http",
    "css",
    "tsx",
    "dockerfile",
}
require("nvim-treesitter").install(ensure_installed)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then
            return
        end
        local ok_add = pcall(vim.treesitter.language.add, lang)
        if not ok_add then
            return
        end
        pcall(vim.treesitter.start, buf, lang)
    end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())
vim.lsp.config("*", { capabilities = capabilities })
vim.lsp.enable({ "lua_ls", "pyrefly", "ruff", "rust_analyzer", "svelte", "ts_ls" })
