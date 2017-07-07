#!/bin/sh

. ./helper/cmd.sh
. ./helper/os.sh
. ./helper/package.sh

ruby_install() {
  package_install ruby

  if on_mac; then

    package_install libffi
    package_install libyaml
    package_install openssl

    package_install rbenv
    package_install ruby-build

    name="Install rbenv ruby $1"
    rbenv_init
    eval_cmd "$name" "rbenv install --skip-existing $1"
    rbenv global "$1"
  fi
}

gem_update() {
  name="Update gems"

  rbenv_init
  eval_cmd "$name" "gem update --force"
}

gem_install() {
  name="Install $1"

  rbenv_init
  eval_cmd "$name" "gem install $1"
}

rbenv_init() {
  if command -v rbenv > /dev/null; then
    eval "$(rbenv init -)"
  fi
}
