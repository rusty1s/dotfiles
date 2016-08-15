#!/bin/bash

# create vim symlinks
ln -sf ~/dotfiles/vim/init.vim ~/.vimrc
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim

# create vim directories and load vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install or update vim plugins
vim +PlugUpdate +PlugClean! +qall!

# install npm packages
npm install -g trash-cli

npm update -g
