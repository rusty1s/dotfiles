#!/bin/sh

. ./helper/cmd.sh

gpg_import() {
  name="Import $(basename "$1")"

  eval_cmd "$name" "gpg --import $1"
}
