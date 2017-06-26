#!/bin/sh

. ./helper/echos.sh
. ./helper/pacman.sh
. ./helper/symlink.sh
. ./helper/yarn.sh

header "JavaScript"

pacman_install "nodejs"
pacman_install "npm"
pacman_install "yarn"

symlink "~/dotfiles/playbooks/roles/js/files/.npmrc" "~/.npmrc"

yarn_install "create-react-app"
yarn_install "prettier"
yarn_install "pure-prompt"
