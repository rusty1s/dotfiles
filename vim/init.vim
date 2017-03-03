" vim-plug (https://github.com/junegunn/vim-plug) settings 
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let mapleader=" "

" set cursorline
" set lazyredraw

set visualbell t_vb=  " No sounds
set noswapfile

call plug#begin('~/.config/nvim/bundle')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}
Plug 'SirVer/ultisnips'

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

call plug#end()

" define :Find command that will lists files that contain the searched string
" see also http://goo.gl/yvCS3y
let s:rg='rg ' .
      \ '--column ' .
      \ '--line-number ' .
      \ '--no-heading ' .
      \ '--fixed-strings ' .
      \ '--ignore-case ' .
      \ '--hidden ' .
      \ '--follow ' .
      \ '--glob "!.git/*" ' .
      \ '--color "always" '

command! -bang -nargs=* Find call
      \ fzf#vim#grep(s:rg.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

nnoremap <Leader><Leader> :Files<CR>

set grepprg=rg\ --vimgrep
set path+=**
set complete+=t

set expandtab  " causes spaces to be used in place of tab characters
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent

let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'
let g:UltiSnipsEditSplit='vertical'

nnoremap <Leader>u :UltiSnipsEdit<CR>

let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<NOP>"
let g:UltiSnipsJumpBackwardTrigger="<NOP>"

function! Ulti_ExpandOrEnter()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res
    return ''
  elseif pumvisible()
    return "\<C-y>"
  endif
  return "\<CR>"
endfunction

function! g:SmartTab()
  if pumvisible()
    return "\<C-n>"
  else
    call UltiSnips#JumpForwards()
    if g:ulti_jump_forwards_res
      return ''
    else
      return "\<Tab>"
    endif
  endif
endfunction
  
function! g:SmartShiftTab()
  if pumvisible()
    return "\<C-p>"
  else
    call UltiSnips#JumpBackwards()
    if g:ulti_jump_backwards_res
    else
      return "\<Tab>"
    endif
  endif
endfunction

autocmd VimEnter * inoremap <buffer> <CR> <C-r>=Ulti_ExpandOrEnter()<CR>
inoremap <Tab> <C-r>=SmartTab()<CR>
inoremap <S-Tab> <C-r>=SmartShiftTab()<CR>

nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <CR> o<Esc>

augroup fix_cr_mapping
  autocmd!
  autocmd CmdwinEnter * nnoremap <CR> <CR>
  autocmd BufReadPost quickfix nnoremap <CR> <CR>
augroup END

inoremap jk <Esc>

set hidden

set wildmode=longest:full,full

set showcmd
set statusline=%f
set statusline+=\ %h%w%m%r
set statusline+=%=
set statusline+=%-16(%{exists('g:loaded_fugitive')?fugitive#statusline():''}\%)
set statusline+=\ %P/%L
set statusline+=\

set relativenumber
set number
set numberwidth=2

set ignorecase
set smartcase

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
