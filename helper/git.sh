#!/bin/sh

. ./helper/cmd.sh
. ./helper/package.sh

git_clone() {
  name="Clone $(basename "$1")"

  if ! cmd_exists git; then
    package_install git
  fi

  if [ ! -d "$2" ]; then
    eval_cmd "$name" "git clone $1 $2"
  else
    eval_cmd "Update $(basename "$1")" "git -C $2 pull"
  fi
}

git_remote_url() {
  name="Set remote url of $(basename "$1")"
  eval_cmd "$name" "cd $1 && git remote set-url origin $2"
}
