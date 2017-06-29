#!/bin/sh

. ./helper/echos.sh
. ./helper/command.sh

function symlink() {
  output="Symlink $(basename $1)"
  running "$output"
  command_exists ln "$output"

  from="${1/#\~/$HOME}"
  to="${2/#\~/$HOME}"

  ln -sf "$from" "$to" > /dev/null 2> /tmp/error
  error=$(</tmp/error)

  if [ ! -z "$error" ]; then
    error "$output" "$error"
  fi

  ok "$output"
}
