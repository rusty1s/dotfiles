#!/bin/sh

if [ ! -d "~/dotfiles" ]; then
  git clone git@github.com:rusty1s/dotfiles.git ~/dotfiles
else
  git pull
fi

ln -sf "~/dotfiles/git/gitconfig" "~/.gitconfig"
ln -sf "~/dotfiles/shell/hyper.js" "~/.hyper.js"

mkdir ~/github
