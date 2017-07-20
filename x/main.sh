#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/symlink.sh

print_header "X Window System"

if on_arch; then
  package_install xorg-server
  package_install xorg-xinit
  package_install xorg-xset
  package_install xorg-xrandr
  package_install xorg-xprop
  package_install xterm

  symlink "$HOME/dotfiles/x/.xinitrc" "$HOME/.xinitrc"
fi
