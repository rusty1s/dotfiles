#!/bin/sh

cd "$HOME"

if [ ! -d "$DOTFILES/.git" ]; then
  rm -rf "$DOTFILES"
  git clone https://github.com/rusty1s/dotfiles "$DOTFILES"
else
  cd "$DOTFILES"
  git pull
fi

ln -sf "$DOTFILES/shell/bash_profile" "$HOME/.bash_profile"
source "$HOME/.bash_profile"

ln -sf "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"
