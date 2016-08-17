#!/bin/bash

# create symlinks
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.tern-project ~/.tern-project

# create vim directories and load vim-plug
rm -rf ~/.vim
rm -rf ~/.config/nvim
rm -rf ~/.vimrc_background

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create vim symlinks (override if necassary)
ln -sf ~/dotfiles/vim/init.vim ~/.vimrc
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/UltiSnips ~/.vim/UltiSnips
ln -sf ~/dotfiles/vim/UltiSnips ~/.config/nvim/UltiSnips

# install colorscheme
rm -rf ~/.config/colorschemes
git clone https://github.com/chriskempson/base16-shell.git ~/.config/colorschemes/base16-shell

# install or update vim plugins vim +PlugInstall +qall!  nvim +PlugInstall
# +qall!

# install npm packages
# if !(type trash); then npm install -g trash-cli; fi

# npm update -g

# source ~/.zshrc

# base16_oceanicnext
