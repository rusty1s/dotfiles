" =============== Plugins =====================================================

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" autocompletion engine
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
" javascript editing support
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
" snippets solution
Plug 'SirVer/ultisnips'
" control completion menu via tabs
Plug 'ervandew/supertab'

" =============== Configuration ===============================================

" add deoplete to runtimepath, so we can call its functions
set runtimepath+=~/.config/nvim/cache/deoplete.nvim/

call deoplete#enable()  " start deoplete

" show completion menu on words with at least one character
let g:deoplete#auto_complete_start_length=1

" completion menu should show a list of results from different sources
let g:deoplete#sources={}
let g:deoplete#sources._=['buffer', 'file', 'ultisnips', 'omni']

" ultisnips should always show up as the top result
call deoplete#custom#set('_', 'sorters', ['sorter_word'])
call deoplete#custom#set('ultisnips', 'rank', 9999)

" the input pattern in insert mode to trigger omnicompletion
let g:deoplete#omni#input_patterns=get(g:,'deoplete#omni#input_patterns',{})
let g:deoplete#omni#input_patterns.javascript='[^. \t]\.\w*'

" display function signatures in javascript completion
let g:tern_show_signature_in_pum=1

" ultisnips snippets folder
let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'
" :UltiSnipsEdit should show up as vertical
let g:UltiSnipsEditSplit='vertical'

" scratch window should be closed when the completion menu closes
let g:SuperTabClosePreviewOnPopupClose=1

" =============== Key mappings ================================================

" close completion menu on enter
let g:SuperTabCrMapping=1

" use tab and shift tab to navigate through  entries
let g:SuperTabDefaultCompletionType='<C-n>'

" use tab and shift tab to navigate through snippets
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'

" remap ulti snips expand trigger to enter
let g:UltiSnipsExpandTrigger='<nop>'
inoremap <CR> <C-R>=UltiExpandTrigger()<CR>

function! UltiExpandTrigger()
  call UltiSnips#ExpandSnippet()
  return ''
endfunction
