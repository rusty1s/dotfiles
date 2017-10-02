#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/pacaur.sh
. ./helper/brew.sh
. ./helper/dir.sh
. ./helper/symlink.sh

print_header Terminal

if ! on_mac; then
  package_install rxvt-unicode

  symlink "$DOTFILES/terminal/.Xresources" "$HOME/.Xresources"
  make_dir "$HOME/.config/alacritty"
  symlink "$DOTFILES/terminal/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
else
  brew_cask_install iterm2
  # TODO: Symlink iterm2 config.
fi

if on_arch; then
  pacaur_install alacritty-git
elif on_ubuntu; then
  package_install cmake
  package_install libfreetype6-dev
  package_install libfontconfig1-dev
  package_install xclip
fi
