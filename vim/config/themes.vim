let g:two_firewatch_italics=1
let g:wwdc16_term_italics=1
let g:gruvbox_italic=1
let g:solarized_term_italics=1

let g:gruvbox_contrast_dark='soft'

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
