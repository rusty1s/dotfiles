setlocal textwidth=79
setlocal nosmartindent

nnoremap <Leader>y :Neoformat yapf<CR>
augroup group
  autocmd!
  autocmd BufWritePre * Neoformat yapf
augroup END
