#!/bin/sh

echo " "
echo "########"
echo "# BASE #"
echo "########"
echo " "

sudo apt-get update

sudo apt-get install -y software-properties-common
sudo apt-get install -y pkg-config
sudo apt-get install -y shellcheck

# image formats
sudo apt-get install -y libpng-dev libjpeg8-dev libfreetype6-dev

tic "$DOTFILES/terminfo/xterm-256color-italic.terminfo"
tic -x "$DOTFILES/terminfo/xterm-256color-italic.terminfo"
