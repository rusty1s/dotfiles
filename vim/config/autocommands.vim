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

  " mark specific config files as json
  autocmd BufNewFile,BufRead
        \ .babelrc,
        \ .eslintrc,
        \ .stylelintrc,
        \ .tern-project
        \ setlocal filetype=json

  autocmd BufNewFile,BufRead
        \ Vagrantfile
        \ setlocal filetype=ruby

  autocmd BufReadPre *.jsx let b:javascript_lib_use_react=1

endif
