" =============== Leader ======================================================

let mapleader="\<Space>"

" =============== Normal Mode =================================================

" insert a new line after the current line via enter
nmap <CR> o<Esc>

" =============== Window Management ===========================================

function! WinMove(key)
 @C let t:curwin = winnr()
  exec 'wincmd ' . a:key
  if (t:curwin == winnr())  " we haven't moved
    if (match(a:key, '[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec 'wincmd ' . a:key
  endif
endfunction

" use Leader + hjkl to move around windows
" if we don't move, we create a new window
map <silent> <Leader>h :call WinMove('h')<CR>
map <silent> <Leader>j :call WinMove('j')<CR>
map <silent> <Leader>k :call WinMove('k')<CR>
map <silent> <Leader>l :call WinMove('l')<CR>

" use Leader + HJKL to swap windows
map <silent> <Leader>H :wincmd H<CR>
map <silent> <Leader>J :wincmd J<CR>
map <silent> <Leader>K :wincmd K<CR>
map <silent> <Leader>L :wincmd L<CR>

" =============== Statusbar ===================================================

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

nmap <silent> <NUL> :NERDTreeToggle<CR>

" =============== FZF =========================================================

nmap <Leader><Leader> :FZF<CR>

" =============== UltiSnips ===================================================

nmap <Leader>u :UltiSnipsEdit<CR>

" " =============== Linting =====================================================

" nmap <Leader>o :lopen<CR>
" nmap <Leader>c :lclose<CR>
" nmap <Leader>, :ll<CR>
" nmap <Leader>n :lnext<CR>
" nmap <Leader>p :lprev<CR>

" " =============== Autocompletion ==============================================

" use <C-q> to expand a snippet if no completion menu is present (e.g. visual mode)
let g:UltiSnipsExpandTrigger='<C-q>'
let g:UltiSnipsJumpForwardTrigger='<NOP>'
let g:UltiSnipsJumpBackwardTrigger='<NOP>'

" use enter, tab and shift-tab smartly for neocomplete and ultisnips
imap <silent> <Tab> <C-R>=SmartTab()<CR>
imap <silent> <S-Tab> <C-R>=SmartShiftTab()<CR>
imap <silent> <CR> <C-R>=SmartEnter()<CR>

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
