call plug#begin('~/.vim/bundle')

" =============== General =====================================================

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'

" =============== Themes ======================================================

Plug 'morhetz/gruvbox'
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='soft'

Plug 'lifepillar/vim-wwdc16-theme'
let g:wwdc16_term_italics=1

Plug 'rakr/vim-two-firewatch'
let g:two_firewatch_italics=1

Plug 'lifepillar/vim-solarized8'
let g:solarized_term_italics=1

" =============== Statusbar ===================================================

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1

" =============== Finder ======================================================

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['DS_Store', 'git', 'idea']

Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

" =============== Git =========================================================

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" =============== Languages ===================================================

Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript.jsx' }
let g:used_javascript_libs=''
autocmd BufReadPre *.jsx let g:used_javascript_libs='react'

Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }

Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'alvan/vim-closetag'
let g:closetag_filenames='*.html,*.xml,*.jsx'

Plug 'elzr/vim-json', { 'for': 'json' }

" =============== Autocompletion ==============================================

Plug 'Shougo/neocomplete.vim'

Plug 'SirVer/ultisnips'
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'
let g:UltiSnipsEditSplit='vertical'

" Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
" let g:tern_show_signature_in_pum=1

" =============== Linting =====================================================

" Plug 'neomake/neomake'
" Plug 'benjie/neomake-local-eslint.vim', { 'for': 'javascript' }

call plug#end()
