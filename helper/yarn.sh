#!/bin/sh

. ./helper/echos.sh

function yarn_install() {
  output="Install $1"

  running "$output"

  yarn global add --no-progress "$1@latest" > /dev/null 2> /tmp/error
  error=$(</tmp/error)

  if echo $error | grep -q "error"; then
    error "$output" "$error"
  fi

  ok "$output"
}
