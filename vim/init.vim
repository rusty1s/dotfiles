filetype indent on
syntax enable

let mapleader=" "

nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <CR> o<Esc>

augroup fix_cr_mapping
	autocmd!
	autocmd CmdwinEnter * nnoremap <CR> <CR>
	autocmd BufReadPost quickfix nnoremap <CR> <CR>
augroup END

inoremap jk <Esc>

set backspace=indent,eol,start
set hidden

set wildmenu
set wildmode=longest:full,full

set laststatus=2
set statusline=%f
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
	autocmd BufWritePre * call StripTrailingWhitespace()
	autocmd BufWritePre * call TrimEndLines()
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
