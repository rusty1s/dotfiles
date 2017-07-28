#!/bin/sh

. ./helper/os.sh
. ./helper/echos.sh
. ./helper/pacaur.sh
. ./helper/symlink.sh

if on_arch; then
  print_header "Mouse Settings"

  pacaur_install imwheel

  symlink "$HOME/dotfiles/mouse/.imwheelrc" "$HOME/.imwheelrc"
fi
