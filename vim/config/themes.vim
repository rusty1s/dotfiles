syntax enable

set cursorline
set scrolloff=5

" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
set t_ut=

set termguicolors
set background=dark

if isdirectory(g:plugs['gruvbox'].dir)
  colorscheme gruvbox
  let g:airline_theme='gruvbox'
endif
