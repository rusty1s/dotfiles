setlocal textwidth=100
set expandtab  " Use spaces.
set shiftwidth=2

let g:neoformat_javascript_prettier = {
      \ 'exe': 'prettier',
      \ 'args': ['--stdin', '--trailing-comma all', '--print-width 100', '--single-quote'],
      \ 'stdin': 1,
      \ }

nnoremap <Leader>y :Neoformat prettier<CR>
augroup group
  autocmd!
  autocmd BufWritePre * Neoformat prettier
augroup END
