#!/bin/sh

. ./helper/os.sh
. ./helper/cmd.sh
. ./helper/error.sh
. ./helper/echos.sh

install_brew() {
  if ! on_mac; then
    error_exit "$name" "brew can only be installed on macOS"
  fi

  if ! cmd_exists brew; then
    eval_cmd "Install brew" "/usr/bin/ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\""
  else
    eval_cmd "Update brew" "brew update"
  fi
}

brew_update() {
  name="Update formulas"
  eval_cmd "$name" "brew upgrade"
}

brew_install() {
  name="Install $1"
  if ! brew_installed "$1"; then
    eval_cmd "$name" "brew install $1"
  else
    print_ok "$name"
  fi
}

brew_tap() {
  name="Tap $1"
  eval_cmd "$name" "brew tap $1"
}

brew_cask_update() {
  brew_tap "buo/cask-upgrade"

  name="Update casks"
  eval_cmd "$name" "brew cu --yes"
}

brew_cask_install() {
  name="Install cask $1"
  if ! brew_cask_installed "$1"; then
    eval_cmd "$name" "brew cask install $1"
  else
    print_ok "$name"
  fi
}

brew_installed() {
  brew list "$1" > /dev/null 2>&2
}

brew_cask_installed() {
  brew cask list "$1" > /dev/null 2>&2
}
