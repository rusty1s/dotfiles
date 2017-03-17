" vim-plug (https://github.com/junegunn/vim-plug) settings 
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" set termguicolors
let mapleader=" "
set clipboard=unnamed

set lazyredraw

set visualbell t_vb=  " No sounds
set noswapfile

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
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
Plug 'SirVer/ultisnips'

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
Plug 'w0rp/ale'

call plug#end()

let g:cm_refresh_default_min_word_len=[[1,4], [7,1]]

au User CmSetup call cm#register_source({'name' : 'cm-ultisnips',
      \ 'priority': 10,
      \ 'abbreviation': 'Snippet',
      \ 'word_pattern': '\S+',
      \ 'cm_refresh': 'cm#sources#ultisnips#cm_refresh',
      \ })

" remap j/k to gj/gk only without a count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_statusline_format=['E %d', 'W %d', '']

autocmd filetype python nnoremap <Leader>y :0,$!yapf<CR>

set wildignore+=*.pyc

let g:buftabline_show=1
let g:buftabline_numbers=2

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

let g:UltiSnipsExpandTrigger="<NOP>"
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

function! Ulti_Expand()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res
    return ''
  endif
  return ""
endfunction

function! g:SmartTab()
  if pumvisible()
    return "\<Down>"
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
    return "\<Up>"
  else
    call UltiSnips#JumpBackwards()
    if g:ulti_jump_backwards_res
    else
      return "\<Tab>"
    endif
  endif
endfunction

autocmd VimEnter * inoremap <buffer> <CR> <C-r>=Ulti_ExpandOrEnter()<CR><C-r>=Ulti_Expand()<CR>
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

function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0B'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB'
  elseif (exists('kbytes'))
    return kbytes . 'KB'
  else
    return bytes . 'B'
  endif
endfunction

" set showcmd
set statusline=\ %f
set statusline+=\ %y
set statusline+=%=
set statusline+=%l/%L\ %c
set statusline+=\ %{FileSize()}
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

nmap <Leader>1 <Plug>BufTabLine.Go(1)
nmap <Leader>2 <Plug>BufTabLine.Go(2)
nmap <Leader>3 <Plug>BufTabLine.Go(3)
nmap <Leader>4 <Plug>BufTabLine.Go(4)
nmap <Leader>5 <Plug>BufTabLine.Go(5)
nmap <Leader>6 <Plug>BufTabLine.Go(6)
nmap <Leader>7 <Plug>BufTabLine.Go(7)
nmap <Leader>8 <Plug>BufTabLine.Go(8)
nmap <Leader>9 <Plug>BufTabLine.Go(9)
nmap <Leader>0 <Plug>BufTabLine.Go(10)

let &t_ZH="[3m"
let &t_ZR="[23m"
set t_ZH=[3m
set t_ZR=[23m

set cursorline

highlight Comment ctermfg=DarkGray cterm=italic
highlight Todo ctermbg=none ctermfg=White cterm=bold
highlight CursorLine ctermbg=Black cterm=none
highlight LineNr ctermfg=DarkGray
highlight CursorLineNr ctermfg=White ctermbg=Black
highlight String ctermfg=DarkRed cterm=italic
highlight TabLineFill ctermfg=2
highlight TabLineSel ctermfg=2 cterm=bold
highlight TabLine ctermbg=2 ctermfg=0 cterm=none
highlight BufTabLineActive ctermbg=2 ctermfg=15 cterm=none
highlight StatusLine ctermfg=2 ctermbg=15
