#!/bin/sh

echo " "
echo "########"
echo "# BASE #"
echo "########"
echo " "

sudo apt-get update

sudo apt-get install -y software-properties-common
sudo apt-get install -y pkg-config

tic "$DOTFILES/terminfo/xterm-256color-italic.terminfo"
tic -x "$DOTFILES/terminfo/xterm-256color-italic.terminfo"
