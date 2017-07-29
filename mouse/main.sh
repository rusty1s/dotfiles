#!/bin/sh

. ./vars.sh

. ./helper/os.sh
. ./helper/echos.sh
. ./helper/pacaur.sh
. ./helper/symlink.sh

if on_arch; then
  print_header "Mouse Settings"

  pacaur_install imwheel

  symlink "$DOTFILES/mouse/.imwheelrc" "$HOME/.imwheelrc"
fi
