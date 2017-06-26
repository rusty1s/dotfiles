#!/bin/sh

. ./helper/echos.sh
. ./helper/pacman.sh
. ./helper/yarn.sh

header "JavaScript"

pacman_install "nodejs"
pacman_install "npm"
pacman_install "yarn"

yarn_install "create-react-app"
yarn_install "prettier"
