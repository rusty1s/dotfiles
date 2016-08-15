#!/bin/bash

# create symlinks
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig


# create vim symlinks (override if necassary)
ln -sf ~/dotfiles/vim/init.vim ~/.vimrc
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.tern-project ~/.tern-project

# create vim directories and load vim-plug
rm -rf ~/.vim
rm -rf ~/.config/nvim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install or update vim plugins
vim +PlugUpdate +PlugClean! +qall!

# install npm packages
npm install -g trash-cli

npm update -g
