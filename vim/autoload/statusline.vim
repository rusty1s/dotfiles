function! statusline#filesize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0B'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB'
  elseif (exists('kbytes'))
    return kbytes . 'KB'
  else
    return bytes . 'B'
  endif
endfunction

function! statusline#fileprefix()
  let l:basename=expand('%:h')
  return l:basename . '/'
  " if l:basename == '' || l:basename == '.'
  "   return ''
  " else
  "   " Make sure we show $HOME as ~.
  "   return l:basename
  " endif
endfunction

let g:currentmode={
      \ 'n': 'NORMAL',
      \ 'v': 'VISUAL',
      \ 'V': 'VISUAL LINE',
      \ 's': 'SELECT',
      \ 'i': 'INSERT',
      \ 'R': 'REPLACE',
      \}
