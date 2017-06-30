#!/bin/sh

. ./helper/cmd.sh

remove() {
  name="Remove $(basename "$1")"
  eval_cmd "$name" "rm -rf $1"
}

sudo_remove() {
  name="Remove $(basename "$1")"
  eval_cmd "$name" "sudo rm -rf $1"
}
