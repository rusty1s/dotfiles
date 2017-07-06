#!/bin/sh

. ./helper/cmd.sh
. ./helper/remove.sh

symlink() {
  remove "$2"
  name="Symlink $(basename "$1")"
  eval_cmd "$name" "ln -sf $1 $2"
}

sudo_symlink() {
  sudo_remove "$2"
  name="Symlink $(basename "$1")"
  eval_cmd "$name" "sudo ln -sf $1 $2"
}
