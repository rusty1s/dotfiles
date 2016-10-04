if isdirectory(g:plugs['neomake'].dir)

  if has ('autocmd')
    " lint whenever entering or saving a buffer
    autocmd! BufWritePost,BufEnter * Neomake
    " lint-as-you-type (lagging side effects)
    autocmd InsertChange,TextChanged * update | Neomake
  endif

  " =============== Makers ======================================================

  " use stylelint for scss (prefer local version)
  " github.com/benjie/neomake-local-eslint.vim/blob/master/ftplugin/css.vim
  let s:stylelint_path = system('PATH=$(npm bin):$PATH && which stylelint')
  let b:stylelint_exe = substitute(
        \ s:stylelint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', ''
        \ )

  " github.com/neomake/neomake/blob/master/autoload/neomake/makers/ft/css.vim
  let g:neomake_css_stylelint_maker = {
        \ 'exe': b:stylelint_exe,
        \ 'errorformat': '%+P%f,%*\s%l:%c  %t  %m,%-Q',
        \ }

  let g:neomake_scss_stylelint_maker = g:neomake_css_stylelint_maker

  " github.com/neomake/neomake/issues/534
  let g:neomake_html_html5check_maker = {
        \ 'exe': 'curl',
        \ 'args': ['-s',
        \ '-H', '"Content-Type: text/html; charset=utf-8"',
        \ '--data-binary', '@' . expand('%:p'),
        \ 'https://validator.w3.org/nu/?out=gnu&level=error',
        \ ],
        \ 'errorformat': '%m',
        \ }

  " =============== Languages ===================================================

  " let g:neomake_html_enabled_makers=['html5check']
  let g:neomake_javascript_enabled_makers=['eslint']
  let g:neomake_scss_enabled_makers=['stylelint']
  let g:neomake_css_enabled_makers=['stylelint']

endif
