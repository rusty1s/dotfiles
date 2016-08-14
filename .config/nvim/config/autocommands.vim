if has ('autocmd')

  " load javascript config files as json
  autocmd BufNewFile,BufRead
        \ .babelrc,
        \ .eslintrc,
        \ .stylelintrc,
        \ .tern-project
        \ setlocal filetype=json

  " strip trailing whitespaces on save
  autocmd BufWritePre * StripWhitespace

  " don't wrap lines for specific file types
  autocmd FileType vim,javascript setlocal nowrap colorcolumn=80

  " lint whenever entering or saving a buffer
  autocmd! BufWritePost,BufEnter * Neomake
  " lint-as-you-type (lagging side effects)
  autocmd InsertChange,TextChanged * update | Neomake

endif
