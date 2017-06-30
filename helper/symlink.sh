#!/bin/sh

. ./helper/echos.sh
. ./helper/cmd.sh

symlink() {
  name="Symlink $(basename "$1")"
  print_running "$name"
  eval_cmd "$name" "ln -sf $1 $2"
}
