#!/bin/sh

. ./helper/echos.sh
. ./helper/command.sh

function pacman_update() {
  output="Update packages"
  running "$output"

  verify_command_exists pacman "$output"

  sudo pacman -Syu --noconfirm --noprogressbar > /dev/null 2> /tmp/error
  error=$(</tmp/error)

  if echo $error | grep -qi "error"; then
    error "$output" "$error"
  fi

  ok "$output"
}

function pacman_install() {
  output="Install $1"
  running "$output"

  verify_command_exists pacman "$output"

  sudo pacman -S --noconfirm --noprogressbar "$1" > /dev/null 2> /tmp/error
  error=$(</tmp/error)

  if echo $error | grep -qi "error"; then
    error "$output" "$error"
  fi

  ok "$output"
}
