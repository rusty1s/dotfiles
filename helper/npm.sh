#!/bin/sh

. ./helper/cmd.sh

npm_install() {
  name="Install $1"
  eval_cmd "$name" "npm install -g $1"
}
