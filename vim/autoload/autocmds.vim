function! autocmds#blur_statusline() abort
  let l:blurred=''      " Start with a clean line.'
  let l:blurred.='\ '   " Space.
  " Relative path to directory.
  let l:blurred.='%.20{statusline#fileprefix()}'
  let l:blurred.='%t'   " Filename.
  let l:blurred.='%='   " Split point for left and right groups.

  call s:update_statusline(l:blurred, 'blur')
endfunction

function! autocmds#focus_statusline() abort
  call s:update_statusline('', 'focus')
endfunction

function! s:update_statusline(default, action) abort
  let l:statusline = s:get_custom_statusline(a:action)

  if type(l:statusline) == type('')
    " Apply custom statusline.
    execute 'setlocal statusline=' . l:statusline
  elseif l:statusline == 0
    " Override statusline by plugin.
    return
  else
    execute 'setlocal statusline=' . a:default
  endif
endfunction

function! s:get_custom_statusline(action) abort
  if &ft ==# 'nerdtree'
    return 0  " Don't override; NERDTree does its own thing.
  endif

  return 1  " Use default.
endfunction
