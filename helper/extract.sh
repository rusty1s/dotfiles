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

extract_zip() {
  name="Extract $(basename "$1")"

  if ! cmd_exists unzip; then
    package_install unzip
  fi

  eval_cmd "$name" "unzip -u $1 -d $2"
}

extract_zip_with_password() {
  name="Extract $(basename "$1")"

  if ! cmd_exists unzip; then
    package_install unzip
  fi

  eval_cmd "$name" "unzip -u -P '$2' $1 -d $3"
}
