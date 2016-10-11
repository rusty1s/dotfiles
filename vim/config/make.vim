" function! MakeJavascript()
"   let s:eslint_path = substitute(
"         \ system("PATH=$(npm bin):$PATH && which eslint"),
"         \ '^\n*\s*\(.\{-}\)\n*\s*$',
"         \ '\1',
"         \ ''
"         \ )

"   if executable(s:eslint_path)
"     set makeprg=s:eslint_path
"     set makeprg=/home/vagrant/github/helic-resources/node_modules/.bin/eslint\ -f\ compact
"     set errorformat=%E%f:\ line\ %l\\,\ col\ %c\\,\ Error\ -\ %m,%W%f:\ line\ %l\\,\ col\ %c\\,\ Warning\ -\ %m
"     command! -buffer Make silent make % | silent redraw! | silent wincmd p | cwindow 5
"     autocmd! BufWritePost <buffer> Make
"   endif
" endfunction

" autocmd Filetype javascript,javascript.jsx :call MakeJavascript()

" autocmd Filetype javascript setlocal makeprg=system('PATH=$(npm bin) && which 
" eslint')\ %
" set makeprg=/home/vagrant/github/helic-resources/node_modules/.bin/eslint\ -f\ compact
" set errorformat=%E%f:\ line\ %l\\,\ col\ %c\\,\ Error\ -\ %m,%W%f:\ line\ %l\\,\ col\ %c\\,\ Warning\ -\ %m
" command! -buffer Make silent make % | silent redraw! | silent wincmd p | cwindow 5
" autocmd! BufWritePost <buffer> Make
