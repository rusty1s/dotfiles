#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/dir.sh
. ./helper/download.sh
. ./helper/remove.sh
. ./helper/extract.sh
. ./helper/symlink.sh
. ./helper/remove.sh

print_header Fonts

if ! on_mac; then
  package_install lxappearance
fi

font_dir="$HOME/.fonts"
filename="fonts"
filepath="$font_dir/$filename"
password="$(cat "$DOTFILES/fonts/password.txt")"

make_dir "$font_dir"

download "http://www.roemisch-drei.de/$filename.zip" "$filepath.zip"
extract_zip_with_password "$filepath.zip" "$password" "$font_dir"
remove "$filepath.zip"

if on_arch; then
  sudo_symlink "$filepath/*.otf" "/usr/share/fonts/OTF"
  sudo_symlink "$filepath/patched/*.otf" "/usr/share/fonts/OTF"

  make_dir "$HOME/.config/fontconfig"
  symlink "$HOME/fonts/fonts.conf" "$HOME/.config/fontconfig/fonts.conf"

  sudo_symlink "/etc/fonts/conf.avail/11-lcdfilter-default.conf" "/etc/fonts/conf.d"
  sudo_symlink "/etc/fonts/conf.avail/10-sub-pixel-rgb.conf" "/etc/fonts/conf.d"
  sudo_remove "/etc/fonts/conf.d/10-scale-bitmap-fonts.conf"
fi

if on_mac; then
  symlink "$filepath/*.otf" "$HOME/Library/Fonts"
  symlink "$filepath/patched/*.otf" "$HOME/Library/Fonts"
fi
