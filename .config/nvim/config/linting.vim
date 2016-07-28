" =============== Plugins =====================================================

Plug 'neomake/neomake'

" =============== Configuration ===============================================

" run whenever entering or saving a buffer
autocmd! BufWritePost,BufEnter * Neomake

" open the scratch window automaticlly when Neomake is run
let g:neomake_open_list=2

" =============== Linters =====================================================


