" Show fold column
function! FoldColumnToggle()
	if &foldcolumn
		setlocal foldcolumn=0
	else
		setlocal foldcolumn=4
	endif
endfunction

" Detect empty buffer as JSON file
function! DetectJson()
	if &filetype == '' && getline(1) =~ '^{\|^\['
		set filetype=json
	endif
endfunction

autocmd BufReadPost,BufNewFile,InsertLeave * call DetectJson()

function! DetectHTML()
	if &filetype == '' && getline(1) =~ '^<'
		set filetype=html
	endif
endfunction

autocmd BufReadPost,BufNewFile,InsertLeave * call DetectHTML()

" CursorLine only exists in one window at a time
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Load SPSS syntax
au BufNewFile,BufRead *.sps set filetype=spss

" Run code in buffer
function! CodeRunner()
    if &ft ==# 'python'
        execute 'RPy'
    elseif &ft ==# 'sh'
        execute 'RB'
	elseif &ft ==# 'javascript'
		execute 'RJs'
	elseif &ft ==# 'go'
		execute 'RGo'
    endif
endfunction

augroup code_runner
    au!
    au FileType python command! RPy :!python3 %
    au FileType sh command! RB :!bash %
		au FileType javascript command! RJs :!node %
    nnoremap <F12> :call CodeRunner()<CR>
augroup end

"here is a more exotic version of my original Kwbd script
"delete the buffer; keep windows; create a scratch buffer if no buffers left
function s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(&modified)
      let answer = confirm("This buffer has been modified.  Are you sure you want to delete it?", "&Yes\n&No", 2)
      if(answer != 1)
        return
      endif
    endif
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        enew
        let l:newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif
    if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
      execute "bd! " . s:kwbdBufNum
    endif
    if(!s:buflistedLeft)
      set buflisted
      set bufhidden=delete
      set buftype=
      setlocal noswapfile
    endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction

command! Kwbd call s:Kwbd(1)
nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>
