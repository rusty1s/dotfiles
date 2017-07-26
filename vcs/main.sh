#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/pacaur.sh
. ./helper/symlink.sh

print_header "Version Control Systems"

package_install git

if on_mac; then
  package_install git-crypt
fi

if on_arch; then
  pacaur_install git-crypt
fi

symlink "$HOME/dotfiles/vcs/.gitconfig" "$HOME/.gitconfig"
symlink "$HOME/dotfiles/vcs/.gitignore" "$HOME/.gitignore"

if ! on_mac; then
  package_install subversion
fi

git_remote_url "$HOME/dotfiles" "git@github.com:rusty1s/dotfiles.git"
