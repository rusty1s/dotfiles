function! statusline#fileprefix() abort
  let l:basename=expand('%:h')
  if l:basename ==? '' || l:basename ==? '.'
    return ''
  else
    " Make sure we show $HOME as ~ (https://goo.gl/LloMaA).
    return substitute(l:basename . '/', '\C^' . $HOME, '~', '')
  endif
endfunction

function! statusline#filetype() abort
  if strlen(&ft)
    return ',' . &ft
  else
    return ''
  endif
endfunction

function! statusline#fileencoding() abort
  if strlen(&fenc) && &fenc !=? 'utf-8'
    return ',' . &fenc
  else
    return ''
  endif
endfunction

function! statusline#fileformat() abort
  if strlen(&ff) && &ff !=? 'unix'
    return ',' . &ff
  else
    return ''
  endif
endfunction

function! statusline#readonly() abort
  if &readonly || !&modifiable
    return ' '
  else
    return ''
  endif
endfunction
