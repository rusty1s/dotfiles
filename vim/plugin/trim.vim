augroup trim
  autocmd!
  autocmd BufWritePre * call trim#whitespaces()
  autocmd BufWritePre * call trim#lines()
augroup END
