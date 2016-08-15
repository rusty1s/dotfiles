" wrap lines at the right edge of the window
set wrap

" only auto wrap comments at the 79th column
set textwidth=79
set formatoptions=croqanlj

" wrap lines at convenient points and mark them via …
set linebreak
set showbreak=…

if has ('autocmd')

  " don't wrap lines for specific file types, but show an colorcolumn
  autocmd FileType vim,javascript setlocal nowrap colorcolumn=80

endif
