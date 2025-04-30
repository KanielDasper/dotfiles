let g:vimwiki_list = [{
    \ 'path': '~/Documents/Vimwiki/',
    \ 'syntax': 'markdown',
    \ 'ext': '.md',
    \ 'auto_toc': 1,
    \ 'index': 'index',
    \ 'auto_diary_index': 1
\ }]

let g:vimwiki_use_calendar=1

autocmd BufNewFile *diary/*.wiki 0r! ~/.vim/vimwiki-diary-tpl.py '%'
