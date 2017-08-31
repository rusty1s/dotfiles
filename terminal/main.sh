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

if on_arch; then
  package_install rxvt-unicode
  pacaur_install alacritty-git

  symlink "$DOTFILES/terminal/.Xresources" "$HOME/.Xresources"
  make_dir "$HOME/.config/alacritty"
  symlink "$DOTFILES/terminal/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
fi

if on_mac; then
  brew_cask_install iterm2

  # TODO: Symlink iterm2 config.
fi
