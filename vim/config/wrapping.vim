set wrap
set showbreak=…
set linebreak
set wrapmargin=2

" autowrap comments at the 80th column mark
set textwidth=79
set formatoptions=croqwacnj

" show an colorcolumn for specific file types
autocmd FileType vim setlocal colorcolumn=80
autocmd FileType javascript setlocal colorcolumn=80
