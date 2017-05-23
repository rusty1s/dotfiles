#!/bin/sh

echo arch > /etc/hostname

echo LANG=en_US.UTF-8 > /etc/locale.conf
echo LC_COLLATE=C >> /etc/locale.conf
echo LANGUAGE=en_US >> /etc/locale.conf

echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "en_US ISO-8859-1" >> /etc/locale.gen
echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen
echo "de_DE ISO-8859-1" >> /etc/locale.gen
echo "de_DE@euro ISO-8859-15" >> /etc/locale.gen

locale-gen

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localetime
hwclock --systohc --utc

systemctl enable dhcpcd

pacman -Sy

mkinitcpio -p linux

echo "Please set a root password:"
passwd

pacman -S --noconfirm grub
grub-mkconfig -o /boot/grub/grub.cfg
grub-install /dev/sda

echo "Please remove dotfiles, umount/dev/sda1, exit and reboot."
