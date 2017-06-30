#!/bin/sh

. ./helper/echos.sh

dirname "$0"

command_exists() {
  command -v "$1" &> /dev/null
}

verify_command_exists() {
  if ! command_exists "$1"; then
    error "$2" "$1 doesn't exist."
  fi
}
