#!/bin/sh

echo arch > /etc/hostname

echo LANG=en_US.UTF-8 > /etc/locale.conf
echo LC_COLLATE=C >> /etc/locale.conf
echo LANGUAGE=en_US >> /etc/locale.conf

# Uncomment en_US and de_DE languages.
sed -i s/^#de_DE/de_DE/g /etc/locale.gen
sed -i s/^#en_US/en_US/g /etc/locale.gen

locale-gen

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc --utc

systemctl enable dhcpcd

pacman -Sy

mkinitcpio -p linux

echo "Please set a root password:"
passwd

pacman -S --noconfirm grub
grub-mkconfig -o /boot/grub/grub.cfg
grub-install /dev/sda
