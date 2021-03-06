#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/brew.sh

print_header Latex

if on_mac; then
  brew_cask_install mactex
fi

if on_arch; then
  package_install texlive-most

  # PDF-Viewer.
  package_install zathura
  package_install zathura-pdf-mupdf
fi

if on_ubuntu; then
  package_install texlive-full
fi
