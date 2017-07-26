#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/dir.sh
. ./helper/download.sh
. ./helper/base64.sh
. ./helper/remove.sh
. ./helper/extract.sh
. ./helper/symlink.sh
. ./helper/remove.sh

print_header Fonts

if ! on_mac; then
  package_install lxappearance
fi

make_dir "$HOME/.fonts"

download "http://www.roemisch-drei.de/patched-fonts" "$HOME/.fonts/patched-fonts"
decode "$HOME/.fonts/patched-fonts" "$HOME/.fonts/patched-fonts.zip"
remove "$HOME/.fonts/patched-fonts"
extract_zip_with_password "$HOME/.fonts/patched-fonts.zip" "$(cat "$HOME/dotfiles/fonts/password.txt")" "$HOME/.fonts"

if on_arch; then
  sudo_symlink "$HOME/.fonts/patched-fonts/*Complete.otf" "/usr/share/fonts/OTF"

  make_dir "$HOME/.config/fontconfig"
  symlink "$HOME/fonts/fonts.conf" "$HOME/.config/fontconfig/fonts.conf"

  sudo_symlink "/etc/fonts/conf.avail/11-lcdfilter-default.conf" "/etc/fonts/conf.d"
  sudo_symlink "/etc/fonts/conf.avail/10-sub-pixel-rgb.conf" "/etc/fonts/conf.d"
  sudo_remove "/etc/fonts/conf.d/10-scale-bitmap-fonts.conf"
fi

if on_mac; then
  symlink "$HOME/.fonts/patched-fonts/*Complete.otf" "$HOME/Library/Fonts"
fi
