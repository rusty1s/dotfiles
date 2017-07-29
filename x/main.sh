#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/symlink.sh

if on_arch; then
  print_header "X Window System"

  package_install xorg-server
  package_install xorg-xinit
  package_install xorg-xset
  package_install xorg-xrandr
  package_install xorg-xprop

  symlink "$DOTFILES/x/.xinitrc" "$HOME/.xinitrc"
fi
