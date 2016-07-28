" =============== General Configuration  ======================================

lan en_US          " set the language to english
set number          " show line numbers
set laststatus=2    " always show status bar
set history=1000    " store lots of :cmdline history
set autoread        " reload files changed outside vim
set title           " set the terminal title

" opening a new file when the current buffer has unsaved
" changes causes files to be hidden instead of closed
set hidden

" turn on syntax highlighting
syntax on

" try to detect file types, load plugins for them
" and enable language-dependent indenting
filetype plugin indent on

" make `/`-styles searches case-sensitive only if
" there is a capital letter in the search expression
set ignorecase
set smartcase

" turn backups off since most stuff is in git anyway
set nobackup
set nowb
set noswapfile

" =============== Encoding ====================================================

set fileformat=unix     " unix line endings
set encoding=utf-8      " the encoding displayed
set fileencoding=utf-8  " the encoding written to file

" =============== Typing ======================================================

set backspace=indent,eol,start  " allow backspaces in insert mode
set cursorline                  " mark the current line
set colorcolumn=80              " make a mark for column 80
set nowrap                      " don't wrap lines
set linebreak                   " wrap lines at convenient points
set scrolloff=5                 " scroll if we're  5 lines away from margins