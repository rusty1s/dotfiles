#!/bin/sh

. ./helper/cmd.sh

symlink() {
  name="Symlink $(basename "$1")"
  eval_cmd "$name" "ln -sf $1 $2"
}

sudo_symlink() {
  name="Symlink $(basename "$1")"
  eval_cmd "$name" "sudo ln -sf $1 $2"
}
