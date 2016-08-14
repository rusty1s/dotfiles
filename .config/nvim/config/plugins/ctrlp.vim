" show hidden files
let g:ctrlp_show_hidden=1

" ignore specific folders and files
let g:ctrlp_custom_ignore={
      \ 'dir': '\v[\/](node_modules|\.git|\.idea)$',
      \ 'file': 'DS_Store',
      \ }
