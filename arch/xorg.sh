#!/bin/sh

pacman -S --noconfirm xorg-server xorg-xinit xorg-xset xorg-xrandr
pacman -S --noconfirm virtualbox-guest-utils
pacman -S --noconfirm ttf-dejavu
pacman -S --noconfirm konsole
pacman -S --noconfirm vim

pacman -S --noconfirm i3 dmenu
pacman -S --noconfirm lightdm lightdm-gtk-greeter

systemctl enable lightdm
