#!/bin/sh

if [ ! -d ~/dotfiles ]; then
  git clone git@github.com:rusty1s/dotfiles.git ~/dotfiles
else
  git pull
fi

ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/macos/hyper.js ~/.hyper.js

pip3 install neovim
pip3 install jedi
npm install -g pure-prompt
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/tern-project ~/.tern-project
ln -sf ~/dotfiles/vim/UltiSnips ~/.config/nvim/UltiSnips
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

mkdir -p ~/github
