#!/bin/sh

. ./helper/cmd.sh
. ./helper/package.sh

encode() {
  name="Encode $(basename "$1")"

  if ! cmd_exists base64; then
    package_install base64
  fi

  eval_cmd "$name" "base64 -i $1 -o $2"
}

decode() {
  name="Decode $(basename "$1")"

  if ! cmd_exists base64; then
    package_install base64
  fi

  eval_cmd "$name" "base64 -D -i $1 -o $2"
}
