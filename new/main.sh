#!/bin/bash

export DOTFILES="$HOME/dotfiles"

# Git:
brew install git
ln -sf "$DOTFILES/new/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/new/.gitignore" "$HOME/.gitignore"
cp "$DOTFILES/ssh/id_rsa" "$HOME/.ssh/id_rsa"
chmod 600 "$HOME/.ssh/id_rsa"
cp "$DOTFILES/ssh/id_rsa.pub" "$HOME/.ssh/id_rsa.pub"
git remote set-url origin git@github.com:rusty1s/dotfiles.git
