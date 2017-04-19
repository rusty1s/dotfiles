#!/bin/sh

if [ ! -d ~/dotfiles ]; then
  git clone git@github.com:rusty1s/dotfiles.git ~/dotfiles
else
  git pull
fi

ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/macos/hyper.js ~/.hyper.js

npm install -g pure-prompt
ln -sf ~/dotfiles/macos/zshrc ~/.zshrc

mkdir -p ~/.ssh
ln -sf ~/dotfiles/macos/ssh_config ~/.ssh/config

mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/.tern-project ~/.tern-project
if [ ! -d ~/.config/nvim/after ]; then
  ln -sf ~/dotfiles/vim/after ~/.config/nvim/after
fi

ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

mkdir -p ~/github
