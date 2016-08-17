if has('nvim') && has('python3')

  " start deoplete
  call deoplete#enable()

  " pop the completion menu while typing (at least one character)
  let g:deoplete#disable_auto_complete=0
  call deoplete#custom#set('_', 'min_pattern_length', 1)

  " sources
  let g:deoplete#sources={}
  let g:deoplete#sources._=['buffer', 'file', 'ultisnips', 'omni']

  " ultisnips should always show up at the top
  call deoplete#custom#set('ultisnips', 'rank', 9999)

  " define better marks for the different sources
  call deoplete#custom#set('buffer', 'mark', '[buffer]')
  call deoplete#custom#set('file', 'mark', '[file]')
  call deoplete#custom#set('ultisnips', 'mark', '[snippet]')
  call deoplete#custom#set('omni', 'mark', '')

  " the input pattern for javascript to trigger omnicompletion
  let g:deoplete#omni#input_patterns.javascript='[^. \t]\w*'

elseif has('lua')

  let g:neocomplete#enable_at_startup=1

  let g:neocomplete#disable_auto_complete=0
  let g:neocomplete#auto_completion_start_length=1

  let g:neocomplete#sources={}
  let g:neocomplete#sources._=['buffer', 'file', 'ultisnips', 'omni']

  call neocomplete#custom#source('ultisnips', 'rank', 9999)

  call neocomplete#custom#source('buffer', 'mark', '[buffer]')
  call neocomplete#custom#source('file', 'mark', '[file]')
  call neocomplete#custom#source('ultisnips', 'mark', '[snippet]')
  call neocomplete#custom#source('omni', 'mark', '')

  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns={}
  endif

  let g:neocomplete#sources#omni#input_patterns.javascript='[^. \t]\w*'

else
  echo 'autocompletion disabled'
endif
