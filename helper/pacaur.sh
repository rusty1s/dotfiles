#!/bin/sh

. ./helper/os.sh
. ./helper/error.sh
. ./helper/package.sh
. ./helper/git.sh
. ./helper/cmd.sh

install_pacaur() {
  if ! on_arch; then
    error_exit "Install pacaur" "pacaur can only be installed on arch"
  fi

  package_install expac
  package_install yajl

  git_clone "https://aur.archlinux.org/cower.git" "$HOME/.aur/cower"
  eval_cmd "Install cower" "cd $HOME/.aur/cower && makepkg PKGBUILD --skippgpcheck --install --noconfirm"

  git_clone "https://aur.archlinux.org/pacaur.git" "$HOME/.aur/pacaur"
  eval_cmd "Install pacaur" "cd $HOME/.aur/pacaur && makepkg PKGBUILD --install --noconfirm"
}

pacaur_update() {
  name="Update pacaur packages"
  eval_cmd "$name" "pacaur -Syu --noconfirm"
}

pacaur_install() {
  name="Install pacaur $1"
  eval_cmd "$name" "pacaur -S --noconfirm $1"
}
