#!/bin/sh

. ./helper/echos.sh

function command_exists() {
  command -v "$1" &> /dev/null
}

function verify_command_exists {
  if ! command_exists "$1"; then
    error "$2" "error: $1 doesn't exist."
  fi
}
