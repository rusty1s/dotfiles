#!/bin/sh

. ./helper/cmd.sh
. ./helper/os.sh
. ./helper/package.sh

install_cargo() {
  if ! cmd_exists cargo; then
    if ! on_ubuntu; then
      package_install rust
    else
      name="Install rust"
      eval_cmd "$name" "curl -sf -L https://static.rust-lang.org/rustup.sh | sh"
    fi
  fi
}

cargo_update() {
  name="Update cargo packages"
  eval_cmd "$name" "cargo update"
}

cargo_install() {
  name="Install $1"
  eval_cmd "$name" "cargo install --force $1"
}

