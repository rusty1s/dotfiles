" vim-plug (https://github.com/junegunn/vim-plug) settings 
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let mapleader=" "

" Add all plugins and my configuration to the runtimepath.
let &runtimepath.=",~/dotfiles/vim"
call plug#begin('~/.config/nvim/bundle')
Plug 'elzr/vim-json'
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-fugitive'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
Plug 'w0rp/ale'
call plug#end()

" remap j/k to gj/gk only without a count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" define :Find command that will lists files that contain the searched string
" see also http://goo.gl/yvCS3y
" let s:rg='rg ' .
"       \ '--column ' .
"       \ '--line-number ' .
"       \ '--no-heading ' .
"       \ '--fixed-strings ' .
"       \ '--ignore-case ' .
"       \ '--hidden ' .
"       \ '--follow ' .
"       \ '--glob "!(.git/*|*.pyc)" ' .
"       \ '--color "always" '

" command! -bang -nargs=* Find call
"       \ fzf#vim#grep(s:rg.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

nnoremap <Leader><Leader> :Files<CR>

" set grepprg=rg\ --vimgrep
set clipboard=unnamed
set lazyredraw
set visualbell t_vb=  " No sounds
set noswapfile
set wildignore+=*.pyc
set colorcolumn=+1,+2
set path+=**
set expandtab  " causes spaces to be used in place of tab characters
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nosmartindent
set hidden
" set noshowmode
set wildmode=longest:full,full
set relativenumber
set number
set numberwidth=2
set cursorline
set ignorecase
set smartcase

nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <CR> o<Esc>

augroup fix_cr_mapping
  autocmd!
  autocmd CmdwinEnter * nnoremap <CR> <CR>
  autocmd BufReadPost quickfix nnoremap <CR> <CR>
augroup END

inoremap jk <Esc>

let g:currentmode={
      \ 'n': 'NORMAL',
      \ 'v': 'VISUAL',
      \ 'V': 'VISUAL LINE',
      \ 's': 'SELECT',
      \ 'i': 'INSERT',
      \ 'R': 'REPLACE',
      \}


function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

function! TrimEndLines()
  let save_cursor = getpos('.')
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction

augroup trim
  autocmd!
"  autocmd BufWritePre * call StripTrailingWhitespace()
"  autocmd BufWritePre * call TrimEndLines()
augroup END

function! WinMove(key)
  let t:curwin = winnr()
  exec 'wincmd ' . a:key
  if (t:curwin == winnr())
    " We haven't moved, so we create a new window.
    if (match(a:key, '[jk]'))
      wincmd v
    else
      wincmd s
    endif
    " Jump to the newly created window.
    exec 'wincmd ' . a:key
  endif
endfunction

nnoremap <silent> <Leader>h :call WinMove('h')<CR>
nnoremap <silent> <Leader>j :call WinMove('j')<CR>
nnoremap <silent> <Leader>k :call WinMove('k')<CR>
nnoremap <silent> <Leader>l :call WinMove('l')<CR>

colorscheme happyhacking
