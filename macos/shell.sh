#!/bin/sh

cd "$HOME"

if [ ! -d "$HOME/dotfiles/.git" ]; then
  rm -rf "$HOME/dotfiles"
  git clone https://github.com/rusty1s/dotfiles "$HOME/dotfiles"
else
  cd "$HOME/dotfiles"
  git pull
fi

ln -sf "$HOME/dotfiles/shell/bash_profile" "$HOME/.bash_profile"
source "$HOME/.bash_profile"
