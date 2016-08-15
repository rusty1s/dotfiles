" add deoplete to runtimepath, so we can call its functions
set runtimepath+=~/.config/nvim/bundle/deoplete.nvim/

" start deoplete
call deoplete#enable()

" pop the completion menu while typing (at least one character)
let g:deoplete#disable_auto_complete=0
call deoplete#custom#set('_', 'min_pattern_length', 0)

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
