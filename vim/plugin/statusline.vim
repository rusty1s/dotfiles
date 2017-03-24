set statusline=                             " Start with a clean line.
set statusline+=%1*                         " User group 1.
set statusline+=\                           " Space.
set statusline+=%{statusline#fileprefix()}  " Relative path to directory.
set statusline+=%*                          " Reset highlight group.
set statusline+=%2*                         " User group 2.
set statusline+=%t                          " Filename.
set statusline+=%{statusline#readonly()}    " Readonly flag.
set statusline+=\                           " Space.
set statusline+=%*                          " Reset highlight group.
set statusline+=%3*                         " User group 3.
set statusline+=                           " Powerline arrow.
set statusline+=%*                          " Reset highlight group.
set statusline+=%<                          " Truncation point.
set statusline+=\                           " Space.
set statusline+=%4*                         " Italic highlight group.
" Modified flag, filetype, fileencoding, fileformat, filesize.
set statusline+=%([
      \%M
      \%{statusline#filetype()}
      \%{statusline#fileencoding()}
      \%{statusline#fileformat()}
      \%{statusline#filesize()}
      \]%)
set statusline+=%*                          " Reset highlight group.

" Split point for left and right groups.
set statusline+=%=

set statusline+=%6*     " User group 6.
set statusline+=       " Powerline arrow.
set statusline+=%*      " Reset highlight group.
set statusline+=%7*     " User group 7.
set statusline+=\       " Space
set statusline+=%3l/%L  " Current line number.
set statusline+=\       " Space.
set statusline+=ℓ       " (Literal, \u2113 "SCRIPT SMALL L").
set statusline+=\       " Space.
set statusline+=%-2v    " Current virtual column number.
set statusline+=\       " Space.
set statusline+=%*      " Reset highlight group.

set statusline+=%8*     " User group 8.
set statusline+=       " Powerline arrow.
set statusline+=%*      " Reset highlight group.
set statusline+=%9*     " User group 9.
set statusline+=\       " Space
set statusline+=%3p     " Percentage through buffer.
set statusline+=%%      " Literal %.
set statusline+=\       " Space
set statusline+=%*      " Reset highlight group.
