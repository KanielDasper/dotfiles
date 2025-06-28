# NVIM Configuration

This is my personal NVIM configuration built around Python, Lua and note taking.

## Plugins

| Plugin            | Description (Optional)           |
| ----------------- | -------------------------------- |
| auto-pairs.lua    | For easy brackets                |
| auto-session.lua  | Save NVIM sessions               |
| blink.lua         | Async Auto-completion with Rust  |
| colorscheme.lua   | Tokyo Night                      |
| conform.lua       | Code formatter                   |
| csvviewer.lua     | Organize csv-files               |
| dadbod.lua        | database connection, UI and comp |
| gitsigns.lua      | Diffs and git integration        |
| iron.lua          | interactive REPL                 |
| lazydev.lua       | Nvim and lua QoL                 |
| linting.lua       | Nvim-lint                        |
| lualine.lua       | status line                      |
| mason.lua         | Manage binaries                  |
| nvim-dap.lua      | Interactive debugging            |
| oil.lua           | The best file manager            |
| snacks.lua        | Picker, LazyGit and utils        |
| surround.lua      | Surround like with tpope         |
| todo-comments.lua | Highlighted todo-comments        |
| treesitter.lua    | Better syntax highlighting       |
| trouble.lua       | Better quickfix bar              |
| vim-sleuth.lua    | Automate identation              |
| vimwiki.lua       | Notes and knowledgebase          |

## LSP

The LSP is structured around Neovim 0.11+ with:

```lua
vim.lsp.enable({})
```

New LSPs should have their own configuration in ~/.config/lua/lsp/..

## Dependencies

- Neovim 0.11+
- curl
- git
- fd
