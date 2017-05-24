# Arch Installation

1. `Boot Arch Linux (x86_64)`

## Partition the disks

1. `cfdisk`
1. Choose `dos` label type
1. `/dev/sda1`: Primary root partition (primary, bootable, write)
1. `/dev/sda2`: Swap Partition (primary, type, write)

## Format the disks

1. `mkfs.ext4 /dev/sda1`
1. `mkswap /dev/sda2`

## Mount the file systems

1. `mount /dev/sda1 /mnt`
1. `swapon /dev/sda2`

## Select the mirrors

1. `vim /etc/pacman.d/mirrorlist`
1. Cut and prepend second german mirror to the list

## Install the base packages

1. `pacstrap /mnt base base-devel`
1. `genfstab -p /mnt > /mnt/etc/fstab`
1. `arch-chroot /mnt`

## Configure the system

1. `pacman -S git`
1. `git clone https://github.com/rusty1s/dotfiles /dotfiles`
1. `/dotfiles/arch/system.sh`
1. `rm -rf /dotfiles`
1. `umount/dev/sda1`
1. `exit`
1. `reboot`
1. `Boot existing OS`

## Configure a user

* `useradd -m -g users -s /bin/bash rusty1s`
* `passwd rusty1s`
* `pacman -S sudo`
* In `/etc/sudoers` die Zeile `# %wheel ALL=(ALL) ALL` auskommentieren
* Mit `gpasswd -a rusty1s wheel` den neuen Benutzer zu der Gruppe wheel hinzufuegen

## Weitere Dienste (optional)

* `pacman -S acpid ntp dbus avahi cups cronie`
* `systemctl enable acpid`
* `systemctl enable ntpd`
* `systemctl enable avahi-daemon`
* `systemctl enable org.cups.cupsd.service`
* `systemctl enable cronie`

## Desktopumgebung erstellen

* `pacman -S xorg-server xorg-xinit xorg-xset`
* `pacman -S virtualbox-guest-utils`

### KDE

* `pacman -S plasma kde-l10n-de`
* `pacman -S kde-applications` (optional)
* `pacman -S sddm sddm-kcm`
* `systemctl enable sddm`
* `reboot`

### GNOME

* `pacman -S gnome`
* `pacman -S gnome-extra` (optional)
* `systemctl enable gdm`
* `reboot`

### i3

* `pacman -S i3 dmenu`
* `pacman -S lightdm lightdm-gtk-greeter`
* `systemctl enable lightdm`
* `reboot`
