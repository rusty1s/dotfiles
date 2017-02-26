let mapleader=" "

set visualbell
set t_vb=
call plug#begin('~/.config/nvim/bundle')

" Plug 'tpope/vim-sensible'

" filetype indent on
" syntax enable

" Plug 'ervandew/supertab'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}
Plug 'SirVer/ultisnips'

" Plug 'haya14busa/incsearch.vim'

call plug#end()

" nnoremap /  <Plug>(incsearch-forward)
" nnoremap ?  <Plug>(incsearch-backward)
" nnoremap g/ <Plug>(incsearch-stay)

let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'
let g:UltiSnipsEditSplit='vertical'

nnoremap <Leader>u :UltiSnipsEdit<CR>

let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<NOP>"
let g:UltiSnipsJumpBackwardTrigger="<NOP>"

let g:ulti_expand_res=0
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

autocmd VimEnter * imap <buffer> <CR> <C-r>=Ulti_ExpandOrEnter()<CR>
inoremap <Tab> <C-r>=SmartTab()<CR>
inoremap <S-Tab> <C-r>=SmartShiftTab()<CR>

" inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <CR> pumvisible() ? "\<C-j>" : "\<CR>"

nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
" nnoremap <CR> o<Esc>

augroup fix_cr_mapping
  autocmd!
  autocmd CmdwinEnter * nnoremap <CR> <CR>
  autocmd BufReadPost quickfix nnoremap <CR> <CR>
augroup END

inoremap jk <Esc>

"set backspace=indent,eol,start
set hidden

set wildmenu
set wildmode=longest:full,full

set laststatus=2
set statusline=%f%y
set showcmd

set relativenumber

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

