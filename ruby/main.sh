#!/bin/sh

. ./helper/echos.sh
. ./helper/package.sh
. ./helper/ruby.sh

print_header Ruby

package_install ruby

gem_update

gem_install mdl  # markdownlint
