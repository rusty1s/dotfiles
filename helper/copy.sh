#!/bin/sh

. ./helper/cmd.sh

copy() {
  name="Copy $(basename "$1")"
  eval_cmd "$name" "cp -f $1 $2"
}

sudo_copy() {
  name="Symlink $(basename "$1")"
  eval_cmd "$name" "sudo cp -f $1 $2"
}
