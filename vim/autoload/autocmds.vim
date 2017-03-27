function! autocmds#blur_statusline()
  let l:blurred=''      " Start with a clean line.'
  let l:blurred.='\ '   " Space.
  " Relative path to directory.
  let l:blurred.='%.20{statusline#fileprefix()}'
  let l:blurred.='%t'   " Filename.
  let l:blurred.='%='   " Split point for left and right groups.
  execute 'setlocal statusline=' . l:blurred
endfunction

function! autocmds#focus_statusline()
  execute 'setlocal statusline='
endfunction
