#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/ruby.sh

print_header Ruby

ruby_install "2.4.1"

gem_update

gem_install mdl  # markdownlint
