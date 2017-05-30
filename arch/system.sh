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

# Hide GRUB unless the Shift key is held down
# https://wiki.archlinux.org/index.php/GRUB/Tips_and_tricks
echo GRUB_FORCE_HIDDEN_MENU=\"true\" >> /etc/default/grub
pacman -S --noconfirm wget
wget https://gist.githubusercontent.com/anonymous/8eb2019db2e278ba99be/raw/257f15100fd46aeeb8e33a7629b209d0a14b9975/gistfile1.sh -O /etc/grub.d/31_hold_shift
chmod a+x /etc/grub.d/31_hold_shift
grub-mkconfig -o /boot/grub/grub.cfg
