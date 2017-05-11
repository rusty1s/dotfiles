#!/bin/sh

if [ ! -d ~/dotfiles ]; then
  git clone git@github.com:rusty1s/dotfiles.git ~/dotfiles
else
  git pull
fi

yarn global add pure-prompt
yarn global add create-react-app
yarn global add prettier

ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/macos/hyper.js ~/.hyper.js

ln -sf ~/dotfiles/zshrc/macos.zsh ~/.zshrc

mkdir -p ~/.ssh
ln -sf ~/dotfiles/macos/ssh_config ~/.ssh/config

mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/.tern-project ~/.tern-project
if [ ! -d ~/.config/nvim/after ]; then
  ln -sf ~/dotfiles/vim/after ~/.config/nvim/after
fi

sudo gem install tmuxinator
if [ ! -d ~/.tmuxinator ]; then
  ln -sf ~/dotfiles/tmux/tmuxinator ~/.tmuxinator
fi
ln -sf ~/dotfiles/tmux/macos.conf ~/.tmux.conf

sudo gem install mdl  # markdownlint

mkdir -p ~/github
