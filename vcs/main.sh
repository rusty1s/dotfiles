#!/bin/sh

. ./helper/echos.sh
. ./helper/package.sh
. ./helper/symlink.sh

print_header "Version Control System"

package_install "git"
symlink "$HOME/dotfiles/vcs/.gitconfig" "$HOME/.gitconfig"
symlink "$HOME/dotfiles/vcs/.gitignore" "$HOME/.gitignore"

package_install "subversion"
