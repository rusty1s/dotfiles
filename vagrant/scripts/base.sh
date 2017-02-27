#!/bin/sh

echo " "
echo "########"
echo "# BASE #"
echo "########"
echo " "

sudo apt-get update

sudo apt-get install -y software-properties-common
sudo apt-get install -y pkg-config
sudo apt-get install -y tar
sudo apt-get install -y shellcheck
sudo apt-get install -y keychain
sudo apt-get install -y libgtk2.0-0
sudo apt-get install -y exuberant-ctags

# image formats
sudo apt-get install -y libpng-dev libjpeg8-dev libfreetype6-dev

tic "$HOME/dotfiles/terminfo/xterm-256color-italic.terminfo"
