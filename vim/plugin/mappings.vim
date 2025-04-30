" Motion rebinds
nnoremap <CR> :nohlsearch<CR><CR>:<backspace>
nnoremap U <C-R>
nnoremap <C-Z> <Esc>
vnoremap <C-Z> <Esc>

" Switch Buffers
nnoremap <PageUp> :bn<Cr>
nnoremap <PageDown> :bp<CR>
nnoremap <Del> <Plug>Kwbd

" Quick CMD-line access
nnoremap <C-E> :
vnoremap <C-E> :
inoremap <C-E> :

" indentation made easy
nnoremap > >>
nnoremap < <<

" Don't use Ex mode, use Q for formatting
map Q gq

" Open vim manpages with CTRL-K
"set keywordprg=:Man 
"nnoremap <silent> <C-K> K :set nowrap<cr>

" Directories and registers
nnoremap <leader>ls :buffers<cr>
nnoremap <leader>cd :cd<Space>
nnoremap <leader>r :registers<cr>

" Change wincmd Split
nnoremap <C-W>v :vnew<cr>
nnoremap <C-W>s :new<cr>
nnoremap <C-W>e :enew<cr>
nnoremap <C-W>t :tabnew<cr>
nnoremap <C-W><C-V> :vnew<cr>
nnoremap <C-W><C-S> :new<cr>
nnoremap <C-W><C-E> :enew<cr>
nnoremap <C-W><C-T> :tabnew<cr>

" Switch tabs
nnoremap <C-W><Tab> :tabnext<cr>
nnoremap <C-W><S-Tab> :tabprevious<cr>
"Keybindings for tab navigation with leader and number
nnoremap <C-W>1 1gt
nnoremap <C-W>2 2gt
nnoremap <C-W>3 3gt
nnoremap <C-W>4 4gt
nnoremap <C-W>5 5gt
nnoremap <C-W>6 6gt
nnoremap <C-W>7 7gt
nnoremap <C-W>8 8gt
nnoremap <C-W>9 9gt
nnoremap <C-W>0 :tablast<CR>
nnoremap <C-W>x :tabclose<CR>

" Move in insert - Hammerspoon takes care of this on Mac
" inoremap <C-H> <Left>
" inoremap <C-L> <Right>
" inoremap <C-K> <Up>
" inoremap <C-J> <Down>

" j + j to exit cmd and insert
inoremap <nowait> jj <esc>

" Move lines up and down
nnoremap - :m .+1<CR>
nnoremap _ :m .-2<CR>

" navigate wrapped lines
nnoremap <silent> k gk
nnoremap <silent> j gj

" end and start line
nnoremap <leader>q ^
vnoremap <leader>q ^

" To prevent windows terminal and its slow ass paste
nnoremap <C-V> p
inoremap <C-V> <Esc>p

" Format and detect JSON
nnoremap <leader>js ma:%!jq '.'<cr>'a

" Copy all items - sets mark, goes to top, V to bot, yank then back to mark
nnoremap <localleader>ca mbggVGy'b

" Replace all instances of selection
" (saves a yoink to register 9 and pastes with CTRL-R + 9
vnoremap <leader>rw "9y:%s/<c-r>9/<c-r>9/g<left><left>
nnoremap <leader>rw viw"9y:%s/<c-r>9/<c-r>9/g<left><left>
vnoremap <leader>rl "9y:s/<c-r>9/<c-r>9/g<left><left>
nnoremap <leader>rl viw"9y:s/<c-r>9/<c-r>9/g<left><left>

" Clear whitespace
nnoremap <leader>dw :%s/\s\+$//<cr>

" Show fold column
nnoremap <localleader>fc :call FoldColumnToggle()<cr>

" local leader things
nnoremap <localleader>e :Explore<cr>
nnoremap <localleader>d :echo getcwd()<cr>
nnoremap <localleader>w :w ./
nnoremap <localleader>v :set wrap!<cr>
nnoremap <localleader>l :set cursorline!<cr>
nnoremap <localleader>t :term<cr>
nnoremap <localleader>h :help<cr>:wincmd T<cr>

" vimrc and coc.nvim config shortcuts
nnoremap <localleader>. :source $MYVIMRC<cr>
nnoremap <localleader>cn :edit $MYVIMRC<cr>
nnoremap <localleader>cc :CocConfig<cr>
nnoremap <localleader>cm :CocList marketplace<cr>

" Emacs navigation for commandline
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

"shift arrows to resize splits
nnoremap <s-Right> :vertical resize +5 <CR>
nnoremap <s-LEFT> :vertical resize -5 <CR>
nnoremap <s-UP> :resize +5 <CR>
nnoremap <s-DOWN> :resize -5 <CR>
