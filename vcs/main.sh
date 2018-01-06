#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/pacaur.sh
. ./helper/symlink.sh

print_header "Version Control Systems"

package_install git

if ! on_arch; then
  package_install git-crypt
else
  pacaur_install git-crypt
fi

symlink "$DOTFILES/vcs/.gitconfig" "$HOME/.gitconfig"
symlink "$DOTFILES/vcs/.gitignore" "$HOME/.gitignore"

package_install subversion
