#!/bin/sh

. ./helper/echos.sh

function symlink() {
  output="Symlink $(basename $1)"

  running "$output"

  from="${1/#\~/$HOME}"
  to="${2/#\~/$HOME}"

  ln -sf "$from" "$to" > /dev/null 2> /tmp/error
  error=$(</tmp/error)

  if [ ! -z "$error" ]; then
    error "$output" "$error"
  fi

  ok "$output"
}
