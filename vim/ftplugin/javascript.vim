setlocal textwidth=80
set expandtab  " Use spaces.
set shiftwidth=2

let g:jsx_ext_required = 0  " Allow JSX in normal .js files.

let g:neoformat_javascript_prettier = {
      \ 'exe': 'prettier',
      \ 'args': ['--stdin'],
      \ 'stdin': 1,
      \ }

nnoremap <Leader>y :Neoformat prettier<CR>
augroup group
  autocmd!
  autocmd BufWritePre * Neoformat prettier
augroup END
