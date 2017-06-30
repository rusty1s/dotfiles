#!/bin/sh

. ./helper/cmd.sh

symlink() {
  name="Symlink $(basename "$1")"
  eval_cmd "$name" "ln -sf $1 $2"
}
