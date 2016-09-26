#!/bin/sh

echo " "
echo "########"
echo "# BASE #"
echo "########"
echo " "

sudo apt-get update

sudo apt-get install -y software-properties-common

tic "$HOME/dotfiles/shell/xterm-256color-italic.terminfo"
