" wrap lines at the right edge of the window
set wrap

" only auto wrap comments at the 79th column - a comment paragraph ends with a
" blank line (see :h fo-table)
" set textwidth=79
" set formatoptions=crovanlj

" wrap lines at convenient points and mark them via …
" set linebreak
set showbreak=…

if has ('autocmd')

  " show an colorcolumn for specific file types
  " autocmd FileType vim,javascript setlocal colorcolumn=80

endif
