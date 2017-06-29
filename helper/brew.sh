#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/command.sh

function install_brew() {
  if on_mac; then
    output="Install brew"
    running "$output"

    if ! command_exists brew; then
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /dev/null 2> /tmp/error
      error=$(</tmp/error)

      if echo $error | grep -qi "error"; then
        error "$output" "$error"
      fi
    fi

    ok "$output"
  fi
}

function brew_update() {
  output="Update packages"
  running "$output"

  verify_command_exists brew "$output"

  # Update itself.
  brew update > /dev/null 2> /tmp/error
  error=$(</tmp/error)

  if echo $error | grep -qi "error"; then
    error "$output" "$error"
  fi

  # Upgrade all formulas.
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
