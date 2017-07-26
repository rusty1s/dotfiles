#!/bin/sh

. ./helper/cmd.sh
. ./helper/package.sh
. ./helper/os.sh
. ./helper/brew.sh
. ./helper/pacaur.sh

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

git_crypt_unlock() {
  name="Encrypt $(basename "$1")"

  if ! cmd_exists git-crypt; then
    if on_mac; then
      brew_install git-crypt
    elif on_arch; then
      pacaur_install git-crypt
    fi
  fi

  eval_cmd "$name" "cd $HOME/dotfiles && git-crypt unlock"
}
