#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/pacaur.sh
. ./helper/symlink.sh
. ./helper/dir.sh
. ./helper/download.sh

if on_arch; then
  print_header "i3"

  pacaur_install i3-gaps
  package_install dmenu
  package_install rofi
  package_install compton
  package_install feh

  # Lockscreen dependencies.
  package_install i3lock
  package_install scrot
  package_install imagemagick

  make_dir "$HOME/.config/i3"
  symlink "$DOTFILES/i3/config" "$HOME/.config/i3/config"

  # Wallpapers.
  make_dir "$HOME/wallpapers"
  download "https://i.imgur.com/zF1V6EE.jpg" "$HOME/wallpapers/bg01.jpg"
  download "https://orig00.deviantart.net/88bd/f/2015/234/0/8/yosmite_by_amdpastrana-d96orw5.png" "$HOME/wallpapers/bg02.png"
fi
