call plug#begin('~/.vim/bundle')

Plug 'rakr/vim-two-firewatch'
Plug 'lifepillar/vim-wwdc16-theme'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'alvan/vim-closetag'
Plug 'Shougo/neocomplete.vim'
Plug 'SirVer/ultisnips'

Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript.jsx' }
" Plug 'othree/html5.vim', { 'for': 'html' }
" Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
" Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }

call plug#end()

let g:closetag_filenames='*.html,*.xml,*.jsx'
if has('autocmd')
  autocmd BufReadPre *.jsx let b:javascript_lib_use_react=1
endif

" if has('nvim')
"   call plug#begin('~/.config/nvim/bundle')
" else
"   call plug#begin('~/.vim/bundle')
" endif

" =============== General =====================================================
"
" " set options to neovim's default values when using vim
" if !has('nvim')
"   Plug 'noahfrederick/vim-neovim-defaults'
" endif
"
" " Plug 'junegunn/fzf', { 'dir': '~/.apps/fzf' }
" " Plug 'junegunn/fzf.vim'
" " Plug 'tpope/vim-fugitive'
" " Plug 'mbbill/undotree'
"
" " =============== GUI =========================================================
"
" " Plug 'junegunn/vim-emoji'
" Plug 'vim-airline/vim-airline'
" " Plug 'edkolev/tmuxline.vim'
" " Plug 'Yggdroot/indentLine'
"
" " =============== Themes ======================================================
" "
" Plug 'rakr/vim-two-firewatch'
" Plug 'lifepillar/vim-wwdc16-theme'
"
" " =============== Typing ======================================================
"
"
" " =============== Autocompletion ==============================================
"
" " autocompletion engine
" " if has('nvim')
" "   function! DoRemote(arg)
" "     UpdateRemotePlugins
" "   endfunction
"
" "   Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
" " else
" "   Plug 'Shougo/neocomplete.vim'
" " endif
"
" " javascript editing support
" " Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
" " snippets solution
" Plug 'SirVer/ultisnips'
"
" " =============== Linting =====================================================
"
" " linting engine
" " Plug 'neomake/neomake'
" " prefer local eslint modules
" " Plug 'benjie/neomake-local-eslint.vim', { 'for': 'javascript' }
"
" " =============== Languages ===================================================
"
" " Plug 'othree/html5.vim', { 'for': 'html' }
"
" " Plug 'othree/yajs.vim', { 'for': 'javascript' }
" " Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
"
" " Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
" " Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
"
" " Plug 'elzr/vim-json', { 'for': 'json' }
"
" call plug#end()
