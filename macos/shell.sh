#!/bin/sh

cd "$HOME" || exit

if [ ! -d "~/dotfiles" ]; then
  git clone https://github.com/rusty1s/dotfiles "$DOTFILES"
else
  git pull
fi

ln -sf "~/dotfiles/git/gitconfig" "~/.gitconfig"
ln -sf "~/dotfiles/shell/hyper.js" "~/.hyper.js"

mkdir ~/github
