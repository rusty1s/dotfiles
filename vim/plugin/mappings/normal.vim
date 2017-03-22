" Remap j/k to gj/gk only without a count.
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Remap Enter to create a new line, except in Quickfix and Command Window.
nnoremap <CR> o<Esc>
augroup fix_cr_mapping
  autocmd!
  autocmd CmdwinEnter * nunmap <CR>
  autocmd BufReadPost quickfix nunmap <CR>
augroup END
