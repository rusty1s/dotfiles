#!/bin/sh

. ./helper/echos.sh
. ./helper/cmd.sh

pacman_update() {
  name="Update packages"
  print_running "$name"
  eval_cmd "$name" "sudo pacman -Syu --noconfirm"
}

pacman_install() {
  name="Install $1"
  print_running "$name"
  eval_cmd "$name" "sudo pacman -S --noconfirm $1"
}

pacman_search() {
  pacman -Ss "$1" > /dev/null 2>&1
}
