set wrap
set textwidth=0
set showbreak=…

if has ('autocmd')
  " show an colorcolumn for specific file types
  autocmd FileType vim,javascript setlocal colorcolumn=80
endif
