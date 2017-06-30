#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/dir.sh
. ./helper/copy.sh
. ./helper/symlink.sh
. ./helper/git.sh

print_header SSH

if on_arch; then
  package_install openssh
  package_install seahorse
fi

make_dir "$HOME/.ssh"

copy "$HOME/dotfiles/ssh/id_rsa" "$HOME/.ssh/id_rsa"
copy "$HOME/dotfiles/ssh/id_rsa.pub" "$HOME/.ssh/id_rsa.pub"

if on_mac; then
  symlink "$HOME/dotfiles/ssh/config" "$HOME/.ssh/config"
fi

git_remote_url "$HOME/dotfiles" "git@github.com:rusty1s/dotfiles.git"
