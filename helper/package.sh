#!/bin/sh

. ./helper/os.sh
. ./helper/pacman.sh
. ./helper/apt.sh
. ./helper/brew.sh
. ./helper/error.sh

os_not_supported="It seems that your OS is not supported"

package_update() {
  if on_arch; then
    pacman_update
  elif on_ubuntu; then
    apt_update
  elif on_mac; then
    brew_update
  else
    error_exit "Update packages" "$os_not_supported"
  fi
}

package_install() {
  if on_arch; then
    pacman_install "$1"
  elif on_ubuntu; then
    apt_install "$1"
  elif on_mac; then
    brew_install "$1"
  else
    error_exit "Install $1" "$os_not_supported"
  fi
}
