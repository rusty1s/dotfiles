#!/bin/sh

. ./helper/echos.sh
. ./helper/pacaur.sh
. ./helper/symlink.sh

header "Mouse"

pacaur_install "imwheel"

symlink "~/dotfiles/mouse/.imwheelrc" "~/.imwheelrc"
