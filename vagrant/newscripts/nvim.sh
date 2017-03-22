#!/bin/sh

sudo apt-get install -y libtool autoconf automake g++ pkg-config unzip cmake
sudo apt-get install -y python-dev python-pip python3-dev python3-pip

cd ~/.sources/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo makie install

sudo pip3 install neovim

mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/after ~/.config/nvim/after
ln -sf ~/dotfiles/vim/.tern-project ~/.tern-project
