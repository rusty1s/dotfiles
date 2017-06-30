#!/bin/sh

. ./helper/echos.sh
. ./helper/package.sh
. ./helper/symlink.sh

print_header "Git"

package_install "git"

symlink "$HOME/dotfiles/git/.gitconfig" "$HOME/.gitconfig"
symlink "$HOME/dotfiles/git/.gitignore" "$HOME/.gitignore"
