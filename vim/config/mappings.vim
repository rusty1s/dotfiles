" =============== Leader ======================================================


" =============== Normal Mode =================================================



" =============== Insert Mode =================================================


" =============== Fugitive ====================================================

" we need to remove some mappings so we can use <Leader>h without delay
autocmd VimEnter * :unmap <Leader>hp
autocmd VimEnter * :unmap <Leader>hr
autocmd VimEnter * :unmap <Leader>hu
autocmd VimEnter * :unmap <Leader>hs

" =============== Window Management ===========================================

function! WinMove(key)
  let t:curwin = winnr()
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

" use <Leader>h,j,k,l to move around windows
" if we don't move, we create a new window
map <silent> <Leader>h :call WinMove('h')<CR>
map <silent> <Leader>j :call WinMove('j')<CR>
map <silent> <Leader>k :call WinMove('k')<CR>
map <silent> <Leader>l :call WinMove('l')<CR>

" use <Leader>H,J,K,L to swap windows
map <silent> <Leader>H :wincmd H<CR>
map <silent> <Leader>J :wincmd J<CR>
map <silent> <Leader>K :wincmd K<CR>
map <silent> <Leader>L :wincmd L<CR>
