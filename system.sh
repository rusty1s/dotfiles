#!/bin/sh

. ./helper/echos.sh
. ./helper/pacman.sh

header "System"

pacman_update
