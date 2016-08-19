#!/bin/sh

# remove directory
rm -rf ~/.vim

# install plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create symlinks
ln -sf ~/dotfiles/vim/.tern-project ~/.tern-project
ln -sf ~/dotfiles/vim/init.vim ~/.vimrc
ln -sf ~/dotfiles/vim/UltiSnips ~/.vim/UltiSnips

# install plugins
vim +PlugInstall +qall!
