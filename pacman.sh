#!/bin/sh

. ./echos.sh

function pacman_install() {
  running "Install $1"
  sudo pacman -S --noconfirm --noprogressbar "$1" >/dev/null 2>&1
  ok "Install $1"
}
