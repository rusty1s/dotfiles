" wrap lines at the right edge of the window
set wrap

" only auto wrap comments at the 79th column - a comment paragraph ends with a
" blank line (see :h fo-table)
" set textwidth=79
" set formatoptions=crovanlj

" wrap lines at convenient points and mark them via …
set linebreak
set nolist
set showbreak=…

if has ('autocmd')

  " don't wrap lines for specific file types, but show an colorcolumn
  autocmd FileType vim,javascript setlocal nowrap colorcolumn=80

endif
