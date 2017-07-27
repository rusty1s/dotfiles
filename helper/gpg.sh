#!/bin/sh

. ./helper/cmd.sh

gpg_public_key_exists() {
  gpg --list-keys | grep -qi "$1"
}

gpg_private_key_exists() {
  gpg --list-secret-keys | grep -qi "$1"
}

gpg_import_public_key() {
  name="Import public key $(basename "$1")"

  if ! gpg_public_key_exists "$2"; then
    eval_cmd "$name" "gpg --import $1"
  fi
}

gpg_import_private_key() {
  name="Import private key $(basename "$1")"

  if ! gpg_private_key_exists "$2"; then
    eval_cmd "$name" "gpg --import $1"
  fi
}
