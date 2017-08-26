setlocal expandtab  " Use spaces.
setlocal shiftwidth=2

let g:neoformat_javascript_prettier = {
      \ 'exe': 'prettier',
      \ 'args': ['--stdin'],
      \ 'stdin': 1,
      \ }

nnoremap <Leader>y :Neoformat prettier<CR>
augroup json_group
  autocmd!
  autocmd BufWritePre * Neoformat prettier
augroup END
