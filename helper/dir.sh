#!/bin/sh

. ./helper/echos.sh
. ./helper/cmd.sh

make_dir() {
  name="Create directory $(basename "$1")"
  print_running "$name"
  eval_cmd "$name" "mkdir -p $1"
}
