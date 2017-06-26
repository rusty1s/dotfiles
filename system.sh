#!/bin/sh

. ./helper/echos.sh
. ./helper/pacman.sh

header "System"

pacman_update

pacman_install "wget"
pacman_install "curl"
pacman_install "zip"
pacman_install "unzip"
pacman_install "ripgrep"
