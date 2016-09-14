#!/bin/sh

echo " "
echo "########"
echo "# TMUX #"
echo "########"
echo " "

sudo add-apt-repository ppa:pi-rho/dev
sudo apt-get update
sudo apt-get install -y tmux

# symlinks
ln -sf $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
