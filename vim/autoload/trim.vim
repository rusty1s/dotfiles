function! trim#whitespaces() abort
  if !&binary && &filetype !=? 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

function! trim#lines() abort
  let l:save_cursor = getpos('.')
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', l:save_cursor)
endfunction
