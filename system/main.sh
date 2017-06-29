#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/pacman.sh
. ./helper/brew.sh

header "System"

if on_arch; then
  pacman_update
else
  install_brew
  brew_update
fi

# pacman_install "wget"
# pacman_install "curl"
# pacman_install "zip"
# pacman_install "unzip"
# pacman_install "ripgrep"
