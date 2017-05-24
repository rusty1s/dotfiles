#!/bin/sh

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
