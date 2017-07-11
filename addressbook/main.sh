#!/bin/sh

. ./helper/echos.sh
. ./helper/package.sh
. ./helper/dir.sh
. ./helper/symlink.sh

print_header Addressbook

package_install abook

make_dir "$HOME/.abook"
symlink "$HOME/dotfiles/addressbook/addressbook" "$HOME/.abook/addressbook"
