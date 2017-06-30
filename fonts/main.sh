#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/dir.sh
. ./helper/download.sh
. ./helper/extract.sh
. ./helper/symlink.sh
. ./helper/remove.sh

print_header Fonts

if ! on_mac; then
  package_install tar
  package_install lxappearance
fi

make_dir "$HOME/.fonts"

download "http://www.roemisch-drei.de/patched-fonts.tar.gz" "$HOME/.fonts/patched-fonts.tar.gz"
extract_tar "$HOME/.fonts/patched-fonts.tar.gz" "$HOME/.fonts"

if on_arch; then
  sudo_symlink "$HOME/.fonts/patched-fonts/**/*.otf" "/usr/share/fonts/OTF"

  make_dir "$HOME/.config/fontconfig"
  symlink "$HOME/fonts/fonts.conf" "$HOME/.config/fontconfig/fonts.conf"

  # Ensure absence of font configuration.
  sudo_remove "/etc/fonts/conf.d/10-scale-bitmap-fonts.conf"
fi

if on_mac; then
  symlink "$HOME/.fonts/patched-fonts/patched-fonts/**/*.otf" "$HOME/Library/Fonts"
fi