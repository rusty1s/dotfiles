if has('nvim')
  call plug#begin('~/.config/nvim/bundle')
else
  call plug#begin('~/.vim/bundle')
endif

" =============== General =====================================================
"
" set options to neovim's default values when using vim
if !has('nvim')
  Plug 'noahfrederick/vim-neovim-defaults'
endif

Plug 'junegunn/fzf', { 'dir': '~/.apps/fzf' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" =============== GUI =========================================================

Plug 'junegunn/vim-emoji'
Plug 'vim-airline/vim-airline'
" Plug 'edkolev/tmuxline.vim'
Plug 'Yggdroot/indentLine'

" =============== Themes ======================================================
"
Plug 'rakr/vim-two-firewatch'

" =============== Typing ======================================================

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'

" =============== Autocompletion ==============================================

" autocompletion engine
if has('nvim')
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction

  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
else
  Plug 'Shougo/neocomplete.vim'
endif

" javascript editing support
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
" snippets solution
Plug 'SirVer/ultisnips'

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
