#!/bin/sh

sudo pacman -Syu --noconfirm  # Full system upgrade

sudo pacman -S --noconfirm python-pip python2-pip
sudo pip install pip
sudo pip install virtualenv
sudo pip2 install pip
sudo pip2 install virtualenv

sudo pacman -S --noconfirm git
sudo pacman -S --noconfirm subversion
sudo pacman -S --noconfirm neovim
sudo pacman -S python-neovim python2-neovim
sudo pacman -S --noconfirm ripgrep
sudo pacman -S --noconfirm nodejs npm
sudo pacman -S --noconfirm yarn
sudo pacman -S --noconfirm jdk8-openjdk maven

sudo pacman -S --noconfirm mariadb
sudo mysql_install_db --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mysqld  # Start the service.
sudo systemctl enable mysqld  # Enable the service to start on boot.
mysql_secure_installation
