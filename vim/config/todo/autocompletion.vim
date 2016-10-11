" let deoplete and ultisnips work nicely together
" set completeopt=menu

" if has('nvim') && has('python3') && isdirectory(g:plugs['deoplete.nvim'].dir)

"   " start deoplete
"   call deoplete#enable()

"   " pop the completion menu while typing (at least one character)
"   let g:deoplete#disable_auto_complete=0
"   call deoplete#custom#set('_', 'min_pattern_length', 1)

"   " sources
"   let g:deoplete#sources={}
"   let g:deoplete#sources._=['buffer', 'file', 'ultisnips', 'omni']

"   " ultisnips should always show up at the top
"   call deoplete#custom#set('ultisnips', 'rank', 9999)

"   " define better marks for the different sources
"   call deoplete#custom#set('buffer', 'mark', '[buffer]')
"   call deoplete#custom#set('file', 'mark', '[file]')
"   call deoplete#custom#set('ultisnips', 'mark', '[snippet]')
"   call deoplete#custom#set('omni', 'mark', '')

"   if !exists('g:deoplete#omni#input_patterns')
"     let g:deoplete#omni#input_patterns = {}
"   endif

"   " the input pattern for javascript to trigger omnicompletion
"   let g:deoplete#omni#input_patterns.javascript='[^. \t]\w*'

if has('lua') && isdirectory(g:plugs['neocomplete.vim'].dir)

  " start neocomplete
  let g:neocomplete#enable_at_startup=1

  " pop the completion menu while typing (at least one character)
  let g:neocomplete#disable_auto_complete=0
  let g:neocomplete#auto_completion_start_length=1

  " sources
  let g:neocomplete#sources={}
  let g:neocomplete#sources._=['buffer', 'file', 'ultisnips', 'omni']

  " ultisnips should always show up at the top
  call neocomplete#custom#source('ultisnips', 'rank', 9999)

  " define better marks for the different sources
  call neocomplete#custom#source('buffer', 'mark', '[buffer]')
  call neocomplete#custom#source('file', 'mark', '[file]')
  call neocomplete#custom#source('ultisnips', 'mark', '[snippet]')
  call neocomplete#custom#source('omni', 'mark', '')

  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns={}
  endif

  " the input pattern for javascript to trigger omnicompletion
  " let g:neocomplete#sources#omni#input_patterns.javascript='[^. \t]\w*'
endif
" =============== Autocompletion ==============================================

" use <C-q> to expand a snippet if no completion menu is present (e.g. visual mode)

" use enter, tab and shift-tab smartly for neocomplete and ultisnips
" imap <silent> <Tab> <C-R>=SmartTab()<CR>
" imap <silent> <S-Tab> <C-R>=SmartShiftTab()<CR>
" imap <silent> <CR> <C-R>=SmartEnter()<CR>

" function! SmartTab()
"   if pumvisible()
"     return "\<C-n>"
"   endif

"   call UltiSnips#JumpForwards()
"   if g:ulti_jump_forwards_res
"     return ''
"   endif

"   return "\<Tab>"
" endfunction

" function! SmartShiftTab()
"   if pumvisible()
"     return "\<C-p>"
"   endif

"   call UltiSnips#JumpBackwards()
"   if g:ulti_jump_backwards_res
"     return ''
"   endif

"   return "\<C-d>"
" endfunction

" function! SmartEnter()
"   call UltiSnips#ExpandSnippet()
"   if g:ulti_expand_res
"     return ''
"   endif

"   if pumvisible()
"     return "\<C-y>"
"   endif

"   return "\<CR>"
" endfunction
