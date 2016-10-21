#!/bin/sh

echo " "
echo "########"
echo "# BASE #"
echo "########"
echo " "

sudo apt-get update

sudo apt-get install -y software-properties-common

tic "$DOTFILES/terminfo/xterm-256color-italic.terminfo"
tic -x "$DOTFILES/terminfo/xterm-256color-italic.terminfo"
