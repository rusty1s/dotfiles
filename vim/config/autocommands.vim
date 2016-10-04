if has('autocmd')

  " strip trailing whitespaces on save
  autocmd BufWritePre * StripWhitespace

  " trim blank lines at end of file on save
  function! TrimEndLines()
    let save_cursor = getpos('.')
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
  endfunction

  autocmd BufWritePre * call TrimEndLines()

  " file types
  autocmd BufNewFile,BufRead .{babelrc,eslintrc,stylelintrc,,tern-project} setf json
  autocmd BufNewFile,BufRead Vagrantfile setf ruby

endif
