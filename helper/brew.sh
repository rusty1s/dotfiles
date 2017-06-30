#!/bin/sh

. ./helper/os.sh
. ./helper/cmd.sh
. ./helper/error.sh

install_brew() {
  name="Install brew"

  if ! on_mac; then
    error_exit "$name" "brew can only be installed on macOS"
  fi

  if ! cmd_exists brew; then
    eval_cmd "$name" "/usr/bin/ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    eval_cmd "$name" "brew update"
  fi
}

brew_update() {
  name="Update packages"
  eval_cmd "$name" "brew upgrade"
}

brew_install() {
  name="Install $1"
  eval_cmd "$name" "brew install $1"
}

brew_tap() {
  name="Tap $1"
  eval_cmd "$name" "brew tap $1"
}

brew_search() {
  brew search "$1" > /dev/null 2>&1
}
