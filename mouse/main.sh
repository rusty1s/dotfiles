#!/bin/sh

. ./helper/os.sh

if on_arch; then
  . ./helper/echos.sh
  . ./helper/pacaur.sh
  . ./helper/symlink.sh

  print_header "Mouse Settings"

  pacaur_install imwheel

  symlink "$HOME/dotfiles/mouse/.imwheelrc" "$HOME/.imwheelrc"
fi
