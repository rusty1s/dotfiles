#!/bin/sh

. ./helper/echos.sh

function command_exists() {
  if [ ! command -v "$1" &> /dev/null ]; then
    error "$2" "error: $1 doesn't exist."
  fi
}
