#!/bin/sh

. ./helper/echos.sh
. ./helper/package.sh
. ./helper/dir.sh
. ./helper/symlink.sh

print_header Fonts

if ! on_mac; then
  package_install tar
  package_install lxappearance
fi

make_dir "$HOME/.fonts"

# download "http://www.roemisch-drei.de/patched-fonts.tar.gz" "$HOME/.fonts"
