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
1. Login as `root`.

## Configure a user

1. `git clone https://github.com/rusty1s/dotfiles /root/dotfiles`
1. `/root/dotfiles/arch/user.sh username`
1. `rm -rf /root/dotfiles`
1. `reboot`
1. Login as user.

## Configure X Server and i3

1. `git clone https://github.com/rusty1s/dotfiles`
1. `./arch/xorg.sh`

## Install pacman apps

1. `./arch/pacman.sh`

## Start X Server

1. `reboot`
1. Login as user.
1. `startx`
