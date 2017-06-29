#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/command.sh

function install_brew() {
  output="Install brew"
  running "$output"

  if ! on_mac; then
    error "$output" "error: brew can only be installed on a mac."
  fi

  if ! command_exists brew; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /dev/null 2> /tmp/error
  else
    brew update > /dev/null 2> /tmp/error
  fi

  error=$(</tmp/error)

  if echo $error | grep -qi "error"; then
    error "$output" "$error"
  fi

  ok "$output"
}

function brew_update() {
  output="Update packages"
  running "$output"

  verify_command_exists brew "$output"

  brew upgrade > /dev/null 2> /tmp/error
  error=$(</tmp/error)

  if echo $error | grep -qi "error"; then
    error "$output" "$error"
  fi

  ok "$output"
}

function brew_install() {
  output="Install $1"
  running "$output"

  verify_command_exists brew "$output"

  brew install --upgrade "$1" > /dev/null 2> /tmp/error
  error=$(</tmp/error)

  if echo $error | grep -qi "error"; then
    error "$output" "$error"
  fi

  ok "$output"
}

function brew_search() {
  if ! command_exists brew; then
    return 1
  fi

  brew search "$1" > /tmp/info
  info=$(</tmp/info)

  if [ ! -z "$info" ]; then
    return 0
  else
    return 1
  fi
}
