#!/bin/sh

. ./helper/echos.sh

function makedir() {
  output="Create directory $1"

  running "$output"

  dir="${1/#\~/$HOME}"

  mkdir -p "$dir" > /dev/null 2> /tmp/error
  error=$(</tmp/error)

  if [ ! -z "$error" ]; then
    error "$output" "$error"
  fi

  ok "$output"
}
