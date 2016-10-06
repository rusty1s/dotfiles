set term=xterm-256color-italic
set termguicolors

syntax enable
set cursorline

" disable Background Color Erase (BCE) so that color schemes render properly 
" when inside 256-color tmux and GNU screen.
" see also http://snk.tuxfamily.org/log/vim-256color-bce
set t_ut=

" =============== Line Numbers ================================================

set number
set relativenumber

" remap j/k to gj/gk only without a count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" =============== Statusbar ===================================================

set laststatus=2
set noshowmode      " dont show the current mode in the lower right corner

" =============== Themes ======================================================

set background=dark

if isdirectory(g:plugs['gruvbox'].dir)
  colorscheme gruvbox
  let g:airline_theme='gruvbox'
endif
