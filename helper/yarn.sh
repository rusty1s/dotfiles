#!/bin/sh

. ./helper/cmd.sh
. ./helper/dir.sh

yarn_update() {
  if [ ! -d "$HOME/.config/yarn/global" ]; then
    make_dir "$HOME/.config/yarn/global"
    eval_cmd "Init global packages" "cd $HOME/.config/yarn/global && yarn init --yes"
  fi

  name="Update yarn packages"
  eval_cmd "$name" "yarn global upgrade"
}

yarn_install() {
  name="Install $1"
  eval_cmd "$name" "yarn global add $1@latest"
}
