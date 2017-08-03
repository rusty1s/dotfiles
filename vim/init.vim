set encoding=utf-8
scriptencoding utf-8

" vim-plug (https://github.com/junegunn/vim-plug) settings
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  augroup plug_install
    autocmd!
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  augroup END
endif

let g:mapleader=' '

" Add all plugins and my configuration to the runtimepath.
let &runtimepath.=',~/dotfiles/vim'
call plug#begin('~/.config/nvim/bundle')
Plug 'scrooloose/nerdtree'
Plug 'sbdchd/neoformat'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
Plug 'w0rp/ale'
" Try to detect the kind of indentation in your file and set Vim's options to
" keep it that way.
Plug 'tpope/vim-sleuth'
" Automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'
call plug#end()

set background=dark
colorscheme happyhacking
