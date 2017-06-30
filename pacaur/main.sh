#!/bin/sh

. ./helper/os.sh

if on_arch; then
  . ./helper/echos.sh
  . ./helper/pacaur.sh

  print_header Pacaur

  install_pacaur
  pacaur_update

  pacaur_install neofetch
fi
