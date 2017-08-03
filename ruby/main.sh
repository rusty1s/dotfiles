#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/ruby.sh
. ./helper/symlink.sh

print_header Ruby

ruby_install "$RUBY_VERSION"

gem_update

gem_install mdl
symlink "$DOTFILES/ruby/.mdlrc" "$HOME/.mdlrc"
