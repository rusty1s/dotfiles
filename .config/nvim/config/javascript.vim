" =============== Plugins =====================================================

Plug 'pangloss/vim-javascript'  " syntax highlighting and indenting
Plug 'mxw/vim-jsx'              " syntax highlighting and indenting for JSX

" =============== Configuration ===============================================

" open these config files with filetype json
autocmd BufNewFile,BufRead .babelrc setlocal filetype=json
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
autocmd BufNewFile,BufRead .tern-project setlocal filetype=json
