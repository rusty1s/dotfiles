augroup focus
  autocmd!
  autocmd BufEnter,FocusGained,VimEnter,WinEnter * setlocal colorcolumn=+1,+2
  autocmd FocusLost,WinLeave * let &l:colorcolumn=join(range(1, 255), ',')
  autocmd BufEnter,FocusGained,VimEnter,WinEnter * setlocal cursorline
  autocmd FocusLost,WinLeave * setlocal nocursorline
augroup END
