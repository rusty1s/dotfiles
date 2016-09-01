#!/bin/sh

echo "---"
echo "--- Installing tmux"
echo "---"

sudo apt-get install tmux

ln -sf $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
