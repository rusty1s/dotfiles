let g:two_firewatch_italics=1
let g:wwdc16_term_italics=1
let g:gruvbox_italic=1
let g:solarized_term_italics=1

set termguicolors
set background=dark

if isdirectory(g:plugs['gruvbox'].dir)
  colorscheme gruvbox
endif