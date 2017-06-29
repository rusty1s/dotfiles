#!/bin/sh

. ./helper/echos.sh

function makedir() {
  output="Create directory $1"

  running "$output"

  mkdir -p "${1/#\~/$HOME}" > /dev/null 2> /tmp/error
  error=$(</tmp/error)

  if [ ! -z "$error" ]; then
    error "$output" "$error"
  fi

  ok "$output"
}

function isdir() {
  if [ -d "${1/#\~/$HOME}" ]; then
    return 0
  else
    return 1
  fi
}
