#!/bin/sh

. ./helper/cmd.sh

install_ruby() {
  name="Install ruby $1"
  eval_cmd "$name" "rbenv install --skip-existing $1"
  rbenv global "$1"
  init_rbenv
}

gem_update() {
  name="Update gems"
  init_rbenv
  eval_cmd "$name" "gem update --force"
}

gem_install() {
  name="Install $1"
  init_rbenv
  eval_cmd "$name" "gem install $1"
}

init_rbenv() {
  eval "$(rbenv init -)"
}
