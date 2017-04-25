#!/bin/sh

sudo pacman -Syu --noconfirm  # Full system upgrade

sudo pacman -S --noconfirm python-pip python2-pip
sudo pip install --upgrade distribute
sudo pip install --upgrade pip
sudo pip install virtualenv
sudo pip2 install --upgrade distribute
sudo pip2 install --upgrade pip
sudo pip2 install virtualenv

sudo pacman -S --noconfirm subversion
sudo pacman -S --noconfirm neovim
sudo pacman -S --noconfirm ripgrep
sudo pacman -S --noconfirm nodejs npm
sudo pacman -S --noconfirm yarn
sudo pacman -S --noconfirm jdk8-openjdk maven mariadb
