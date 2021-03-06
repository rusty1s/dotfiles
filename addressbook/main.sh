#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/package.sh
. ./helper/remove.sh
. ./helper/symlink.sh

print_header Addressbook

package_install abook

remove "$HOME/.abook"
symlink "$DOTFILES/addressbook" "$HOME/.abook"
