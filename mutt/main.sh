#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/package.sh
. ./helper/dir.sh
. ./helper/symlink.sh

print_header Mail

package_install mutt

make_dir "$HOME/.mutt"
symlink "$DOTFILES/mutt/muttrc" "$HOME/.mutt/muttrc"

# Symlink accounts.
symlink "$DOTFILES/mutt/account.r3.fey" "$HOME/.mutt/account.r3.fey"
