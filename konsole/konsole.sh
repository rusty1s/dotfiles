#!/bin/sh

mkdir -p ~/.local/share/konsole
rm -f ~/.local/share/konsole/*
ln -sf ~/dotfiles/konsole/rusty1s.profile ~/.local/share/konsole/rusty1s.profile
ln -sf ~/dotfiles/konsole/HappyHacking.colorscheme ~/.local/share/konsole/HappyHacking.colorscheme
