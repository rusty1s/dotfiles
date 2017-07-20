#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/pacaur.sh
. ./helper/symlink.sh
. ./helper/dir.sh

print_header "i3"

if on_arch; then
  pacaur_install i3-gaps
  package_install dmenu
  package_install rofi
  package_install compton
  package_install feh

  # Lockscreen dependencies.
  package_install i3lock
  package_install scrot
  package_install imagemagick

  make_dir "$HOME/.config/i3"
  symlink "$HOME/dotfiles/i3/config" "$HOME/.config/i3/config"
fi
