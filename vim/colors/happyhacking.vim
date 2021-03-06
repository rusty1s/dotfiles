" Cursor line.
hi CursorLine ctermbg=0 cterm=None
hi ColorColumn ctermbg=0

" Line numbers.
hi LineNr ctermfg=4
hi CursorLineNr ctermfg=15 cterm=bold

" Gutter.
hi SignColumn ctermbg=none
hi ALEErrorSign ctermfg=1 ctermbg=none cterm=none
hi ALEWarningSign ctermfg=3 ctermbg=none cterm=none
hi SignifySignAdd ctermbg=none ctermfg=2
hi SignifySignChange ctermbg=none ctermfg=3
hi SignifySignDelete ctermbg=none ctermfg=5
hi SignifySignChangeDelete ctermbg=none ctermfg=5
hi SignifySignDeleteFirstLine ctermbg=none ctermfg=5

" Status line.
hi StatusLine ctermbg=8 ctermfg=7 cterm=none
hi StatuslineNC ctermbg=8 ctermfg=7 cterm=none
hi User1 ctermbg=7 ctermfg=8
hi User2 ctermbg=7 ctermfg=8 cterm=bold
hi User3 ctermbg=8 ctermfg=7

hi User6 ctermbg=2 ctermfg=8
hi User7 ctermbg=8 ctermfg=15
hi User8 ctermbg=8 ctermfg=7
hi User9 ctermbg=7 ctermfg=8

" Tab line.
hi TabLineFill ctermbg=8 ctermfg=none cterm=none
hi TabLine ctermbg=8 ctermfg=7 cterm=none
hi TabLineSel ctermbg=7 ctermfg=8 cterm=bold
hi BufTabLineActive ctermbg=8 ctermfg=7 cterm=none

" Split.
hi VertSplit ctermbg=none ctermfg=8 cterm=none

" Listchars.
hi NonText ctermfg=8
hi Specialkey ctermfg=8

" Autocompletion menu.
hi Pmenu ctermbg=7 ctermfg=8
hi PmenuSel ctermbg=8 ctermfg=15
hi PmenuSbar ctermbg=15 ctermfg=15  " Scrollbar.
hi PmenuThumb ctermbg=8 ctermfg=8   " Thumb of the scrollbar.

" Visual and Search.
hi Visual ctermbg=15 ctermfg=0
hi IncSearch ctermbg=15 ctermfg=0 cterm=none
hi Search ctermbg=4 ctermfg=0

" Diff.
hi DiffAdd ctermbg=2 ctermfg=0
hi DiffChange ctermbg=3 ctermfg=0
hi DiffDelete ctermbg=1 ctermfg=0
hi DiffText ctermbg=3 ctermfg=1 cterm=bold

" Fold.
hi Folded ctermbg=none ctermfg=4
hi FoldColumn ctermbg=none ctermfg=4

" Text.
hi MatchParen ctermbg=none ctermfg=5 cterm=bold
hi Function ctermfg=4  " Braces.
hi String ctermfg=1
hi Comment ctermfg=7 cterm=italic
hi Todo ctermbg=none ctermfg=15 cterm=bold
hi ALEError ctermbg=1 ctermfg=15
hi ALEWarning ctermbg=3 ctermfg=15
