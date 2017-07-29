#!/bin/sh

. ./helper/cmd.sh

chmod_private() {
  name="Change $(basename "$1") permission to private"
  eval_cmd "$name" "chmod 600 $1"
}
