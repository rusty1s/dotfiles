# Arch Linux

## Installation

1. `Boot Arch Linux (x86_64)`

### Partition the disks

1. `cfdisk`
1. Choose `dos` label type
1. `/dev/sda1`: Primary root partition (primary, bootable, write)
1. `/dev/sda2`: Swap Partition (primary, type, write)

### Format the disks

1. `mkfs.ext4 /dev/sda1`
1. `mkswap /dev/sda2`

### Mount the file systems

1. `mount /dev/sda1 /mnt`
1. `swapon /dev/sda2`

### Select the mirrors

1. `ping google.com`
1. `vim /etc/pacman.d/mirrorlist`
1. Add to the top:
```
## Germany
Server = https://arch.32g.eu/$repo/os/$arch
```
from [Mirrorlist](https://www.archlinux.org/mirrorlist/) [[Germany]](https://www.archlinux.org/mirrorlist/?country=DE&protocol=http&protocol=https&ip_version=4)

### Install the base packages

1. `export http_proxy` and `export https_proxy` (optional)
1. `pacstrap /mnt base base-devel`
1. `genfstab -p /mnt > /mnt/etc/fstab`
1. `arch-chroot /mnt`

### Configure the system

1. `pacman -S git vim`
1. `git clone https://github.com/rusty1s/dotfiles /dotfiles`
1. `/dotfiles/arch_system.sh`
1. `rm -rf /dotfiles`
1. `exit`
1. `umount /dev/sda1`
1. `reboot`
1. `Boot existing OS`
1. Login as `root`.

### Configure a user

1. `export http_proxy` and `export https_proxy` (optional)
1. `git clone https://github.com/rusty1s/dotfiles /root/dotfiles`
1. `/root/dotfiles/arch_user.sh $username`
1. `rm -rf /root/dotfiles`
1. `reboot`
1. Login as user.
1. Add `export http_proxy`, `export https_proxy` to `~/.bash_profile` and source it (optional)
1. Add `Defaults env_keep += "http_proxy https_proxy"` to `/etc/sudoers/` (optional)

### Install and configure user system

1. `git clone https://github.com/rusty1s/dotfiles`
1. `./bootstrap`
1. `./launch`

## Configuration
