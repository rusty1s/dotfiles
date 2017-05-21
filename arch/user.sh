#!/bin/sh

useradd -m -g users -s /bin/bash rusty1s
echo "Please enter a password for user rusty1s:"
passwd rusty1s

pacman -S --noconfirm sudo
gpasswd -a rusty1s wheel

echo "Please uncomment %wheel ALL=(ALL) ALL in /etc/sudoers."
