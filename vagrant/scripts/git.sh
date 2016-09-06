#!/bin/sh

echo " "
echo "#######"
echo "# GIT #"
echo "#######"
echo " "

sudo apt-get install -y git

ln -sf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig
