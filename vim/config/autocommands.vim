if has ('autocmd')

  " strip trailing whitespaces on save
  autocmd BufWritePre * StripWhitespace

  " TODO strip trailing newlines at eof on save


  " mark specific config files as json
  autocmd BufNewFile,BufRead
        \ .babelrc,
        \ .eslintrc,
        \ .stylelintrc,
        \ .tern-project
        \ setlocal filetype=json

endif
