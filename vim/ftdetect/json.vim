augroup detect_json
  autocmd!
  autocmd BufNewFile,BufRead
        \ .babelrc,
        \.eslintrc,
        \.stylelintrc,
        \.prettierrc,
        \.tern-project set filetype=json
augroup END
