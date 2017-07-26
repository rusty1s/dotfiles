#!/bin/sh

. ./vars.sh

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

symlink "$DOTFILES/vcs/.gitconfig" "$HOME/.gitconfig"
symlink "$DOTFILES/vcs/.gitignore" "$HOME/.gitignore"

if ! on_mac; then
  package_install subversion
fi

git_remote_url "$DOTFILES" "git@github.com:rusty1s/dotfiles.git"
