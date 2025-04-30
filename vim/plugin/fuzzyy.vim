nnoremap <silent> <leader>fib :FuzzyInBuffer<CR>
nnoremap <silent> <leader>fi :FuzzyColors<CR>
nnoremap <silent> <leader>fd :FuzzyHelps<CR>
nnoremap <silent> <leader>ff :FuzzyFiles<CR>
nnoremap <silent> <leader>fc :FuzzyCommands<CR>
nnoremap <silent> <leader>fg :FuzzyGrep<CR>
nnoremap <silent> <leader>fb :FuzzyBuffers<CR>
nnoremap <silent> <leader>fh :FuzzyHighlights<CR>
nnoremap <silent> <leader>fr :FuzzyMRUFiles<CR>

" Set to 0 to disable default keybindings
" Default to 1
let g:enable_fuzzyy_keymaps = 0

" Make FuzzyFiles respect .gitignore if set to 1
" only work when
" 1. inside a git repository and git is installed
" 2. or fd is installed
" Default to 0
let g:files_respect_gitignore = 1

" FuzzyFiles will exclude the files/directory in these two lists
" only work when g:files_respect_gitignore = 0
" The following is the default
let g:fuzzyy_files_ignore_file = ['*.beam', '*.so', '*.exe', '*.dll', '*.dump', '*.core', '*.swn', '*.swp']
let g:fuzzyy_files_ignore_dir = ['.git', '.hg', '.svn', '.rebar', '.eunit', 'PyEnv']

" Change navigation keymaps
let g:fuzzyy_keymaps = {
\     'menu_up': ["\<c-p>", "\<Up>"],
\     'menu_down': ["\<c-n>", "\<Down>"],
\     'menu_select': ["\<CR>"],
\     'preview_up': ["\<c-i>"],
\     'preview_down': ["\<c-f>"],
\     'cursor_begining': ["\<c-a>"],          
\     'cursor_end': ["\<c-e>"],               
\     'backspace': ["\<bs>"],
\     'delete_all': ["\<c-k>"],              
\     'delete_prefix': ["\<c-u>"],          
\     'exit': ["\<Esc>", "\<c-c>", "\<c-[>"], 
\ }

" Change highlight of the matched text when searching
" Default to cursearch
let g:fuzzyy_menu_matched_hl = 'cursearch'

" Whether show devicons when using FuzzyFiles or FuzzyBuffers
" Requires vim-devicons
" Default to 1 if vim-devicons is installed, 0 otherwise
let g:fuzzyy_devicons = 0

" Whether enable dropdown theme
" Default to 0
let g:fuzzyy_dropdown = 0

" FuzzyMRUFiles default shows MRU files that are in the current project
" default to 0
let g:fuzzyy_mru_project_only = 0

" FuzzyBuffers will exclude the buffers in this list
" default to ['__vista__']
let g:fuzzyy_buffers_exclude = ['__vista__']

" FuzzyBuffer keymap for commands speicific to FuzzyBuffers
" default to is the following
let g:fuzzyy_buffers_keymap = {
\    'delete_buffer': "",
\    'close_buffer': "\<c-l>",
\ }

" window layout configuraton
" you can override it by setting g:fuzzyy_window_layout
" e.g. You can disable preview window for FuzzyFiles command by doing this:
" let g:fuzzyy_window_layout = { 'FuzzyFiles': { 'preview': 0 } }
" default value:
let g:fuzzyy_window_layout = {
\    'FuzzyFiles': {
\        'preview': 1,       
\        'preview_ratio': 0.7,
\        'width': 0.9,      
\    },
\    'FuzzyGrep': {
\        'preview': 1,
\        'preview_ratio': 0.7,
\        'width': 0.9,
\    },
\    'FuzzyBuffers': {
\        'preview': 1,
\        'preview_ratio': 0.7,
\        'width': 0.9,
\    },
\    'FuzzyMRUFiles': {
\        'preview': 1,
\        'preview_ratio': 0.7,
\        'width': 0.9,
\    },
\    'FuzzyHighlights': {
\        'preview': 1,
\        'preview_ratio': 0.7,
\        'width': 0.9,
\    },
\ }
