#!/bin/sh

source "$HOME/dotfiles/ubuntu/.pathrc"
FILE="Miniconda3-latest-Linux-x86_64.sh"
wget "https://repo.anaconda.com/miniconda/$FILE"
sh "$FILE"
rm -rf "$FILE"
