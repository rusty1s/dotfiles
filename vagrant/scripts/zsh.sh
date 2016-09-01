#!/bin/sh

echo "---"
echo "--- Installing zsh"
echo "---"

sudo apt-get install -y zsh zsh-doc

ln -sf $HOME/dotfiles/zsh/zshrc $HOME/.zshrc

sudo chsh -s $(which zsh) $(whoami)
zsh

echo "---"
echo "--- Installing z"
echo "---"

git clone https://github.com/rupa/z.git $HOME/.config/z

echo "---"
echo "--- Installing fzf"
echo "---"

git clone https://github.com/junegunn/fzf.git $HOME/.config/fzf
