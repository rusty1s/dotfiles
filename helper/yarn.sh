#!/bin/sh

. ./helper/echos.sh

function yarn_install() {
  prefix="Install"

  running "$prefix $1"

  yarn global add --no-progress "$1@latest" > /dev/null 2> /tmp/error
  error=$(</tmp/error)

  if echo $error | grep -q "error"; then
    error "$prefix $1" "$error"
  fi

  ok "$prefix $1"
}
