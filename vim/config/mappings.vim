" =============== Leader ======================================================

let mapleader="\<Space>"

" =============== Hard Mode ===================================================

" disable the arrow keys
map <Up> <NOP>
map <Right> <NOP>
map <Down> <NOP>
map <Left> <NOP>
imap <Up> <NOP>
imap <Right> <NOP>
imap <Down> <NOP>
imap <Left> <NOP>

" =============== Normal Mode =================================================

" insert a new line after the current line via enter
nmap <CR> o<Esc>

" =============== Airline =====================================================

nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9

nmap <Leader>+ <Plug>AirlineSelectNextTab
nmap <Leader>- <Plug>AirlineSelectPrevTab

" =============== NERDTree ====================================================

nmap <NUL> :NERDTreeToggle<CR>

" =============== UltiSnips ===================================================

nmap <Leader>u :UltiSnipsEdit<CR>

" =============== Linting =====================================================

nmap <Leader>o :lopen<CR>
nmap <Leader>c :lclose<CR>
nmap <Leader>, :ll<CR>
nmap <Leader>n :lnext<CR>
nmap <Leader>p :lprev<CR>

" =============== Autocompletion ==============================================

" use <C-q> to expand a snippet if no completion menu is present (e.g.  visual
" mode)
let g:UltiSnipsExpandTrigger='<C-q>'
let g:UltiSnipsJumpForwardTrigger='<NOP>'
let g:UltiSnipsJumpBackwardTrigger='<NOP>'

" use enter, tab and shift-tab smartly for deoplete and ultisnips
imap <Tab> <C-R>=SmartTab()<CR>
imap <S-Tab> <C-R>=SmartShiftTab()<CR>
imap <CR> <C-R>=SmartEnter()<CR>

" add ultisnips to runtimepath, so we can call its functions
set runtimepath+=~/dotfiles/vim/bundle/ultisnips/

function! SmartTab()
  if pumvisible()
    return "\<C-n>"
  endif

  call UltiSnips#JumpForwards()
  if g:ulti_jump_forwards_res
    return ''
  endif

  return "\<Tab>"
endfunction

function! SmartShiftTab()
  if pumvisible()
    return "\<C-p>"
  endif

  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res
    return ''
  endif

  return "\<C-d>"
endfunction

function! SmartEnter()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res
    return ''
  endif

  if pumvisible()
    return "\<C-y>"
  endif

  return "\<CR>"
endfunction
