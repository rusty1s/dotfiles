" snippets folder
if has('nvim')
  let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'
else
  let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'
endif

" :UltiSnipsEdit should show up as vertical
let g:UltiSnipsEditSplit='vertical'

autocmd *.jsx setlocal UltiSnipsAddFileTypes jsx.javascript
