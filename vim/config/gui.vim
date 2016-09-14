set termguicolors
set background=dark

if isdirectory(g:plugs['vim-two-firewatch'].dir)
  let g:two_firewatch_italics=1
  colorscheme two-firewatch
  let g:airline_theme='twofirewatch'
endif

let g:indentLine_char='┆'
let g:indentLine_concealcursor=''
