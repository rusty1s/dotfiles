#!/bin/sh

. ./helper/cmd.sh

yarn_install() {
  name="Install $1"
  eval_cmd "$name" "yarn global add $1@latest"
}
