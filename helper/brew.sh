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
  name="Update formulas"
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

brew_cask_update() {
  brew_tap "buo/cask-upgrade"

  name="Update casks"
  eval_cmd "$name" "brew cu"
}

brew_cask_install() {
  name="Install cask $1"
  eval_cmd "$name" "brew cask install $1"
}
