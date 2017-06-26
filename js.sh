#!/bin/sh

. ./echos.sh
. ./pacman.sh
. ./yarn.sh

header "JavaScript"

pacman_install nodejs
pacman_install npm
pacman_install yarn

yarn_install create-react-app
yarn_install prettier
yarn_install pure-prompt
