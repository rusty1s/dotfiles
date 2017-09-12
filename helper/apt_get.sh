#!/bin/sh

. ./helper/cmd.sh

apt_get_update() {
  name="Update packages"
  # TODO
  eval_cmd "$name" "sudo apt-get"
}

apt_get_install() {
  name="Install $1"
  # TODO
  eval_cmd "$name" "sudo apt-get $1"
}
