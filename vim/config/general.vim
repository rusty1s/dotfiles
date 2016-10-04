" =============== General Configuration  ======================================

set term=xterm-256color-italic
set number
set cursorline
set backspace=indent,eol,start

set noshowmode      " dont show the current mode in the lower right corner
set ttimeoutlen=0
set clipboard^=unnamedplus,unnamed

" just show the file name in the title
set title
set titlestring=%t

" opening a new file when the current buffer has unsaved changes causes files
" to be hidden instead of closed
set hidden

" make `/`-styles searches case-sensitive only if there is a capital letter in
" earch expression
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic

" turn backups off since most stuff is in git anyway
set nobackup
set nowritebackup
set noswapfile

" =============== Typing ======================================================

set scrolloff=5                 " scroll if we're five lines away from margins
set encoding=utf-8
set ttyfast
set nofoldenable

if has('mouse')
  set mouse=a
endif

set wildmenu
set wildmode=longest:full,full
set updatetime=250

" don't redraw while working to speed up things
set lazyredraw

" search highlighting by hitting escape in normal mode
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

syntax enable
filetype indent on

set relativenumber

" remap j/k to gj/gk only without a count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
