call plug#begin('~/dotfiles/vim/bundle')

" =============== General =====================================================

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'

" =============== GUI =========================================================

Plug 'chriskempson/base16-vim'          " base16 colorscheme

Plug 'vim-airline/vim-airline'          " pretty statusline
Plug 'vim-airline/vim-airline-themes'   " adjust colorscheme for statusline

" =============== Typing ======================================================

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'   " strip trailing whitespaces

" =============== Autocompletion ==============================================

" autocompletion engine
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" javascript editing support
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
" snippets solution
Plug 'SirVer/ultisnips'
" TODO: emmit vim

" =============== Linting =====================================================

" linting engine
Plug 'neomake/neomake'
" prefer local eslint modules
Plug 'benjie/neomake-local-eslint.vim', { 'for': 'javascript' }

" =============== Languages ===================================================

Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'alvan/vim-closetag'

Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }

Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }

Plug 'elzr/vim-json', { 'for': 'json' }

call plug#end()
