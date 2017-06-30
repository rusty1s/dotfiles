#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/pacman.sh
. ./helper/brew.sh

os_not_supported="It seems that your OS is not supported"

package_update() {
  if on_arch; then
    pacman_update
  elif on_mac; then
    install_brew
    brew_update
  else
    print_error "Update packages" "$os_not_supported"
    exit 1
  fi
}

package_install() {
  if on_arch; then
    pacman_install "$1"
  elif on_mac; then
    brew_install "$1"
  else
    print_error "Install $1" "$os_not_supported"
    exit 1
  fi
}
