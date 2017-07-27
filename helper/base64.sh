#!/bin/sh

. ./helper/os.sh
. ./helper/cmd.sh
. ./helper/package.sh

encode() {
  name="Encode $(basename "$1")"

  if on_mac; then
    eval_cmd "$name" "base64 -e $1 $2"
  elif on_arch; then
    eval_cmd "$name" "base64 $1 >> $2"
  fi
}

decode() {
  name="Decode $(basename "$1")"

  if on_mac; then
    eval_cmd "$name" "base64 -d $1 $2"
  elif on_arch; then
    eval_cmd "$name" "base64 -d $1 >> $2"
  fi
}
