#!/bin/sh

rm -rf "$HOME/dotfiles"
git clone https://github.com/rusty1s/dotfiles "$HOME/dotfiles"

ln -sf "$HOME/dotfiles/shell/bash_profile" "$HOME/.bash_profile"
source "$HOME/.bash_profile"
