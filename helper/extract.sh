#!/bin/sh

. ./helper/cmd.sh
. ./helper/package.sh

extract_tar() {
  name="Extract $(basename "$1")"

  if ! cmd_exists tar; then
    package_install tar
  fi

  eval_cmd "$name" "tar -zxvf $1 -C $2"
}
