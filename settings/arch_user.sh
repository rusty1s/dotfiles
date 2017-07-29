#!/bin/sh

if [ "$1" -eq "" ]; then
  echo "Please pass a username."
  exit
fi

useradd -m -g users -s /bin/bash "$1"
echo "Please enter a password for $1:"
passwd "$1"

pacman -S --noconfirm sudo
gpasswd -a "$1" wheel

# Uncomment %wheel ALL=(ALL) NOPASSWD.
sed -i "s/^# %wheel ALL=(ALL) NOPASSWD/%wheel ALL=(ALL) NOPASSWD/g" /etc/sudoers
