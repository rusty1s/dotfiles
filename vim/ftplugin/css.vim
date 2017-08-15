let g:neoformat_css_prettier = {
      \ 'exe': 'prettier',
      \ 'args': ['--stdin', '--parser', 'postcss'],
      \ 'stdin': 1,
      \ }

nnoremap <Leader>y :Neoformat prettier<CR>
augroup group
  autocmd!
  autocmd BufWritePre * Neoformat prettier
augroup END
