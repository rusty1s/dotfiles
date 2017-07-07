#!/bin/sh

. ./helper/cmd.sh
. ./helper/os.sh
. ./helper/package.sh

gem_update() {
  name="Update gems"

  if on_mac; then
    eval_cmd "$name" "sudo gem update --force"
  else
    eval_cmd "$name" "gem update --force"
  fi
}

gem_install() {
  name="Install $1"

  if on_mac; then
    eval_cmd "$name" "sudo gem install $1"
  else
    eval_cmd "$name" "gem install $1"
  fi
}
