#!/bin/sh

mkdir -p /tmp/cower
cd /tmp/cower
gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
makepkg -i PKGBUILD --noconfirm
rm -rf /tmp/cower

mkdir -p /tmp/package-query
cd /tmp/package-query
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=package-query
makepkg -i PKGBUILD --noconfirm
rm -rf /tmp/package-query

mkdir -p /tmp/yaourt
cd /tmp/yaourt
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=yaourt
makepkg -i PKGBUILD --noconfirm
rm -rf /tmp/yaourt
