#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/pacaur.sh
. ./helper/ruby.sh

print_header Ruby

if on_mac; then
  package_install rbenv
  package_install ruby-build
fi

if on_arch; then
  pacaur_install rbenv
  pacaur_install ruby-build
fi

install_ruby "2.4.1"

gem_install mdl  # markdownlint
