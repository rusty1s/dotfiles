#!/bin/sh

. ./helper/echos.sh
. ./helper/command.sh

function install_brew() {
  # install brew
  return 0
}

function brew_update() {
  output="Update packages"
  running "$output"

  verify_command_exists brew "$output"

  # Update itself.
  brew update > /dev/null 2> /tmp/error
  error=$(</tmp/error)

  if echo $error | grep -q "error"; then
    error "$output" "$error"
  fi

  # Upgrade all formulas.
  brew upgrade > /dev/null 2> /tmp/error
  error=$(</tmp/error)

  ok "$output"
}

function brew_install() {
  output="Install $1"
  running "$output"

  verify_command_exists brew "$output"

  brew install --upgrade "$1" > /dev/null 2> /tmp/error
  error=$(</tmp/error)

  if echo $error | grep -q "error"; then
    error "$output" "$error"
  fi

  ok "$output"
}
