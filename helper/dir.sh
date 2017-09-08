#!/bin/sh

. ./helper/cmd.sh

make_dir() {
  name="Create directory $(basename "$1")"
  eval_cmd "$name" "mkdir -p $1"
}

sudo_make_dir() {
  name="Create directory $(basename "$1")"
  eval_cmd "$name" "sudo mkdir -p $1"
}

