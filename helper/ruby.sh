#!/bin/sh

. ./helper/cmd.sh
. ./helper/os.sh
. ./helper/package.sh

install_ruby() {
  package_install libffi
  package_install libyaml
  package_install openssl

  if ! on_mac; then
    package_install zlib
  fi

  name="Install ruby $1"
  init_rbenv
  eval_cmd "$name" "rbenv install --skip-existing $1"
  rbenv global "$1"
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
