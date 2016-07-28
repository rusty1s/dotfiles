" point nvim to the python3 interpreter installed by homebrew
let g:python3_host_prog='/usr/local/bin/python3'

call plug#begin('~/.config/nvim/cache')

" =============== General =====================================================

source ~/.config/nvim/config/general.vim
source ~/.config/nvim/config/gui.vim
source ~/.config/nvim/config/mappings.vim

" =============== Coding ======================================================

source ~/.config/nvim/config/coding.vim
source ~/.config/nvim/config/autocompletion.vim
source ~/.config/nvim/config/linting.vim

" =============== Languages ===================================================

source ~/.config/nvim/config/javascript.vim
source ~/.config/nvim/config/json.vim

call plug#end()
