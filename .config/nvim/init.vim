" point nvim to the python3 interpreter installed by homebrew
let g:python3_host_prog='/usr/local/bin/python3'

" =============== Plugins =====================================================

source ~/.config/nvim/config/plugins.vim

source ~/.config/nvim/config/plugins/airline.vim
source ~/.config/nvim/config/plugins/nerdtree.vim
source ~/.config/nvim/config/plugins/ctrlp.vim
source ~/.config/nvim/config/plugins/deoplete.vim
source ~/.config/nvim/config/plugins/tern.vim
source ~/.config/nvim/config/plugins/ultisnips.vim

" =============== General =====================================================

source ~/.config/nvim/config/gui.vim
source ~/.config/nvim/config/general.vim
source ~/.config/nvim/config/autocommands.vim
source ~/.config/nvim/config/indentation.vim
source ~/.config/nvim/config/mappings.vim

" =============== Coding ======================================================

source ~/.config/nvim/config/autocompletion.vim
source ~/.config/nvim/config/linting.vim
