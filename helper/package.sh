#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/pacman.sh
. ./helper/brew.sh

package_update() {
  if on_arch; then
    pacman_update
  elif on_mac; then
    install_brew
    brew_update
  else
    print_error "Update packages" "Not supported os"
    exit 1
  fi
}

package_install() {
  if on_arch; then
    pacman_install "$1"
  elif on_mac; then
    brew_install "$1"
  else
    print_error "Install $1" "Not supported os"
    exit 1
  fi
}
