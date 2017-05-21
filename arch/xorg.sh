#!/bin/sh

pacman -S --noconfirm xorg-server xorg-xinit xorg-xset
pacman -S --noconfirm virtualbox-guest-utils

pacman -S --noconfirm i3 dmenu
pacman -S --noconfirm lightdm lightdm-gtk-greeter

systemctl enable lightdm
