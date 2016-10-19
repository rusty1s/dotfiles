#!/bin/sh

echo " "
echo "########"
echo "# BASE #"
echo "########"
echo " "

sudo apt-get update

sudo apt-get install -y software-properties-common

tic "$DOTFILES/shell/xterm-256color-italic.terminfo"
tic -x "$DOTFILES/shell/xterm-256color-italic.terminfo"
