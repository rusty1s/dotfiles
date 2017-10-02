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
  if ! cargo_installed "$1"; then
    name="Install $1"
    eval_cmd "$name" "cargo install $1"
  fi
}

cargo_installed() {
  if cargo install --list | grep -qi "$1"; then
    return 0
  else
    return 1
  fi
}
