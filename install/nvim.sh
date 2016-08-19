#!/bin/sh

# remove directory
rm -rf ~/.config/nvim

# install plugin manager
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create symlinks
ln -sf ~/dotfiles/vim/.tern-project ~/.tern-project
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/UltiSnips ~/.config/nvim/UltiSnips

# install plugins
nvim +PlugInstall +qall!
