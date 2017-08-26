setlocal textwidth=80
setlocal expandtab  " Use spaces.
setlocal shiftwidth=2

let g:jsx_ext_required = 0  " Allow JSX in normal .js files.

let g:neoformat_json_prettier = {
      \ 'exe': 'prettier',
      \ 'args': ['--stdin'],
      \ 'stdin': 1,
      \ }

nnoremap <Leader>y :Neoformat prettier<CR>
augroup js_group
  autocmd!
  autocmd BufWritePre * Neoformat prettier
augroup END
