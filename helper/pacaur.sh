#!/bin/sh

. ./helper/cmd.sh

install_pacaur() {
  true
}

pacaur_update() {
  name="Update pacaur packages"
  eval_cmd "$name" "pacaur -Syu --noconfirm"
}

pacaur_install() {
  name="Install pacaur $1"
  eval_cmd "$name" "pacaur -S --noconfirm $1"
}
