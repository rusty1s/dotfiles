#!/bin/sh

. ./helper/echos.sh
. ./helper/cmd.sh

yarn_install() {
  name="Install $1"
  print_running "$name"
  eval_cmd "$name" "yarn global add $1@latest"
}
