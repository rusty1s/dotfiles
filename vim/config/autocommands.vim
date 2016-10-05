" trim blank lines at end of file on save
function! TrimEndLines()
  let save_cursor = getpos('.')
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction

autocmd BufWritePre * call TrimEndLines()

" exist insert mode automatically after inaction
autocmd CursorHoldI * stopinsert
autocmd InsertEnter * let updaterestore=&updatetime | set updatetime=5000
autocmd InsertLeave * let &updatetime=updaterestore

" file types
autocmd BufNewFile,BufRead
      \ .{babelrc,eslintrc,stylelintrc,tern-project} setf json
autocmd BufNewFile,BufRead Vagrantfile setf ruby
