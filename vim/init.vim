if has('nvim')
  " point nvim to the python3 interpreter installed by homebrew
  let g:python3_host_prog='/usr/local/bin/python3'
endif

source ~/dotfiles/vim/config/plugins.vim

" =============== General =====================================================

source ~/dotfiles/vim/config/gui.vim
source ~/dotfiles/vim/config/general.vim
source ~/dotfiles/vim/config/autocommands.vim
source ~/dotfiles/vim/config/wrapping.vim
source ~/dotfiles/vim/config/indentation.vim
source ~/dotfiles/vim/config/mappings.vim

" =============== Coding ======================================================

source ~/dotfiles/vim/config/autocompletion.vim
source ~/dotfiles/vim/config/linting.vim

" =============== Plugin Configuration ========================================

source ~/dotfiles/vim/config/plugins/airline.vim
source ~/dotfiles/vim/config/plugins/nerdtree.vim
source ~/dotfiles/vim/config/plugins/ctrlp.vim
source ~/dotfiles/vim/config/plugins/deoplete.vim
source ~/dotfiles/vim/config/plugins/tern.vim
source ~/dotfiles/vim/config/plugins/ultisnips.vim
