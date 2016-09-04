#!/bin/sh

echo "---"
echo "--- Installing git"
echo "---"

sudo apt-get install -y git

ln -sf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig
