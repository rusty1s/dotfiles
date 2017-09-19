#!/bin/sh

. ./helper/cmd.sh

apt_get_update() {
  name="Update packages"
  eval_cmd "$name" "sudo apt-get --y --force-yes upgrade"
}

apt_get_install() {
  name="Install $1"
  eval_cmd "$name" "sudo apt-get -y --force-yes install $1"
}

apt_get_ppa() {
  name="Add $1"
  eval_cmd "$name" "sudo add-apt-repository $1"
}
