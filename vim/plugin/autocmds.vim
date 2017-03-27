augroup focus
  autocmd!
  autocmd BufEnter,FocusGained,VimEnter,WinEnter * setlocal colorcolumn=+1,+2
  autocmd FocusLost,WinLeave * setlocal colorcolumn=0
  autocmd BufEnter,FocusGained,VimEnter,WinEnter * setlocal cursorline
  autocmd FocusLost,WinLeave * setlocal nocursorline
  autocmd BufEnter,FocusGained,VimEnter,WinEnter * call autocmds#focus_statusline()
  autocmd FocusLost,WinLeave * call autocmds#blur_statusline()
augroup END
