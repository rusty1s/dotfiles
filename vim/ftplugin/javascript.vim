setlocal textwidth=100
set expandtab  " Use spaces.
set shiftwidth=2

nnoremap <Leader>y :Neoformat prettier<CR>
augroup group
  autocmd!
  autocmd BufWritePre * Neoformat prettier
augroup END
