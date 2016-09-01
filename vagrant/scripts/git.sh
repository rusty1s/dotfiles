#!/bin/sh

echo "---"
echo "--- Installing git"
echo "---"

sudo apt-get install git -y

ln -sf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig
