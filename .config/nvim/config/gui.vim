" github.com/chriskempson/base16-shell#base16-vim-users
if filereadable(expand('~/.vimrc_background'))
  let base16colorspace=256
  source ~/.vimrc_background
endif
