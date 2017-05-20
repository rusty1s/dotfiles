# Arch Installation

Partitionierung der Festplatte mit `cfdisk`:
* `dos` label type
* `/dev/sda1`: Primary root partition: 16G, Primary, Bootable
* `/dev/sda2`: Swap Partition: 4G, Primary

Anlegen der Dateisysteme:
* `mkfs.ext4 /dev/sda1`
* `mksawp /dev/sda2`

Einbinden der Partitionen:
* `mount /dev/sda1 /mnt`
* `swapon /dev/sda2`

Das Basissystem installieren:
* `pacstrap /mnt base base-devel`

fstab (file system table) erzeugen, in der die Laufwerke festgelegt werden:
* `genfstab -p /mnt > /mnt/etc/fstab`

Das Installationsmedium verlassen und das neu installierte System starten:
* ` arch-chroot /mnt`

Systemkonfiguration:
* Den Rechnernamen festlegen: `echo arch > /etc/hostname`
* Die Spracheinstellung festlegen:
```
echo LANG=en_US.UTF-8 > /etc/locale.conf
echo LC_COLLATE=C >> /etc/locale.conf
echo LANGUAGE=en_US >> /etc/locale.conf
```
* Die Zeitzone festlegen: `ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime`
* Konfiguration von `/etc/locale.gen`: `vi /etc/locale/gen` und `#` am Anfang folgender Zeilen entfernen `en_US*` (2 Eintraege) und `de_DE*` (3 Eintraege)
* Locale generieren: `locale-gen`

Pacman Repository:
* Pacman Repository Datenbanken neu laden: `pacman -Sy`
* Falls dies Fehler wirft, in `/etc/pacman.d/mirrorlist` den ersten Server auskommentieren

Linux Kernel erzeugen:
* `mkinitcpio -p linux`

Root-Passwort setzen:
* `passwd`

Installation des GRUB Bootloaders:
* `pacman -S grub`
* `grub-mkconfig -o /boot/grub/grub.cfg`
* `grub-install /dev/sda`

Arch Linux neu booten:
* `exit`
* `umount /dev/sda1`
* `reboot`
* `Boot existing OS` im Auswahlmenue waehlen

Einen Benutzer hinzufuegen und Gruppen waehlen:
* `useradd -m -g users -s /bin/bash rusty1s`
* `passwd rusty1s`
* `pacman -S sudo`
* In `/etc/sudoers` die Zeile `# %wheel ALL=(ALL) ALL` auskommentieren
* Mit `gpasswd -a rusty1s wheel` den neuen Benutzer zu der Gruppe wheel hinzufuegen

Weitere notwendige Dienste:
* `systemctl enable dhcpcd`
* `pacman -S acpid ntp dbus avahi cups cronie`
* `systemctl enable acpid`
* `systemctl enable ntpd`
* `systemctl enable avahi-daemon`
* `systemctl enable org.cups.cupsd.service`
* `systemctl enable cronie`
