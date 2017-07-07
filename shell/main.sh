#!/bin/sh

. ./helper/echos.sh
. ./helper/remove.sh
. ./helper/symlink.sh

print_header Shell

remove "$HOME/.bashrc"
remove "$HOME/.bash_profile"
remove "$HOME/.bash_history"
remove "$HOME/.bash_logout"

symlink "$HOME/dotfiles/shell/.zshrc" "$HOME/.zshrc"
