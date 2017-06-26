#!/bin/sh

. ./echos.sh

function yarn_install() {
  running "Install $1"
  yarn global add "$1@latest" > /dev/null 2>&1
  ok "Install $1"
}
