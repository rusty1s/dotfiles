" =============== General Configuration  ======================================

if !has('vim')
  runtime! plugin/neovim_defaults.vim
endif

lan en_US           " set the language to american english

set number
set noshowmode      " dont show the current mode in the lower right corner
set wildmode=full   " zsh like tab completion
set ttimeoutlen=0
set clipboard=unnamed

" just show the file name in the title
set title
set titlestring=%t

" opening a new file when the current buffer has unsaved changes causes files
" to be hidden instead of closed
set hidden

" make `/`-styles searches case-sensitive only if there is a capital letter in
" the search expression
set ignorecase
set smartcase

" turn backups off since most stuff is in git anyway
set nobackup
set nowritebackup
set noswapfile

" =============== Encoding ====================================================

set fileformat=unix     " unix file format
set fileencoding=utf-8  " the encoding written to file

" =============== Typing ======================================================

set cursorline                  " mark the current line
set scrolloff=5                 " scroll if we're five lines away from margins
