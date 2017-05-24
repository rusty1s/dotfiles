#!/bin/sh

sudo pacman -S --noconfirm xorg-server xorg-xinit xorg-xset xorg-xrandr
sudo pacman -S --noconfirm virtualbox-guest-modules-arch virtualbox-guest-utils

sudo pacman -S --noconfirm i3 dmenu

ln -sf ~/dotfiles/x/xinit ~/.xinitrc
mkdir -p ~/.config/i3
ln -sf ~/dotfiles/i3/config ~/.config/i3/config
