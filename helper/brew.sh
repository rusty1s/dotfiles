#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/cmd.sh

install_brew() {
  name="Install brew"
  print_running "$name"

  if ! on_mac; then
    clear_prev_line
    print_error "$name" "brew can only be installed on macOS"
    exit 1
  fi

  if ! cmd_exists brew; then
    eval_cmd "$name" "/usr/bin/ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    eval_cmd "$name" "brew update"
  fi
}

brew_update() {
  name="Update packages"
  print_running "$name"
  eval_cmd "$name" "brew upgrade"
}

brew_install() {
  name="Install $1"
  print_running "$name"
  eval_cmd "$name" "brew install $1"
}

brew_tap() {
  name="Tap $1"
  print_running "$name"
  eval_cmd "$name" "brew tap $1"
}

brew_search() {
  brew search "$1" > /dev/null 2>&1
}
