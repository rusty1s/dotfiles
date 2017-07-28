#!/bin/sh

sudo pacman -S --noconfirm xorg-server xorg-xinit xorg-xset xorg-xrandr xorg-xprop
sudo pacman -S --noconfirm virtualbox-guest-modules-arch virtualbox-guest-utils

yaourt -S --noconfirm i3-gaps
sudo pacman -S --noconfirm i3blocks dmenu

ln -sf ~/dotfiles/arch/.xinitrc ~/.xinitrc
mkdir -p ~/.config/i3
ln -sf ~/dotfiles/i3/config ~/.config/i3/config
