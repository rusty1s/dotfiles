set nocompatible

set term=xterm-256color-italic
set clipboard^=unnamedplus,unnamed

filetype indent on

set backspace=indent,eol,start
set hidden
set lazyredraw
set encoding=utf-8
set ttyfast
set mouse=a
set updatetime=250
set ttimeoutlen=0

" =============== Line Numbers ================================================

set number
set relativenumber

" remap j/k to gj/gk only without a count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" =============== Statusbar ===================================================

set laststatus=2
set noshowmode      " dont show the current mode in the lower right corner

" =============== Searching ===================================================

set ignorecase
set smartcase
set hlsearch
set incsearch
set magic

nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" =============== Backups =====================================================

set nobackup
set nowritebackup
set noswapfile

" =============== Autocompletion ==============================================

set wildmenu
set wildmode=longest:full,full
