#!/bin/sh

. ./helper/cmd.sh

pacman_update() {
  name="Update packages"
  eval_cmd "$name" "sudo -E pacman -Syu --needed --noconfirm"
}

pacman_install() {
  name="Install $1"
  eval_cmd "$name" "sudo -E pacman -S --needed --noconfirm $1"
}
