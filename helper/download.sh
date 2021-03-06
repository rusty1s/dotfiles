#!/bin/sh

. ./helper/cmd.sh
. ./helper/package.sh

download() {
  name="Download $(basename "$1")"

  if ! cmd_exists curl; then
    package_install curl
  fi

  eval_cmd "$name" "curl -o $2 $1"
}
