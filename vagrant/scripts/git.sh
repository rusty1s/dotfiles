#!/bin/sh

echo " "
echo "#######"
echo "# GIT #"
echo "#######"
echo " "

sudo apt-get install -y git

ln -sf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig

echo " "
echo "################################"
echo "# DOWNLOAD GITHUB REPOSITORIES #"
echo "################################"
echo " "

git clone https://github.com/rusty1s/texture-synthesis.git $HOME/github/texture-synthesis
