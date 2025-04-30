" Lightline statusbar
let g:lightline = {
			\ 'colorscheme': '16color',
			\ 'active': {
			\ 'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ], ['syntaxitem'], ['bufnum' ] ],
			\ 'left': [ [ 'mode' ], [ 'readonly' ], [ 'absolutepath' ], [ 'modified' ], [ 'gitbranch' ] ],
			\ },
			\ 'component_function': {
			\ 'gitbranch': 'FugitiveHead',
			\ },
			\ 'component': {
			\ 'charvaluehex': '0x%B',
			\ 'lineinfo': '%l\%L',
			\ },
			\ 'component_expand': {
			\   'buffers': 'lightline#bufferline#buffers'
			\ },
			\ 'component_type': {
			\   'buffers': 'tabsel'
			\ }
			\ }

let g:lightline.separator={ 'left': "\ue0b0", 'right': "\ue0b2" }
let g:lightline.subseparator={ 'left': "\ue0b1", 'right': "\ue0b3" }
