#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/pacaur.sh
. ./helper/dir.sh
. ./helper/symlink.sh

print_header Terminal

if on_arch; then
  pacaur_install alacritty-git

  make_dir "$HOME/.config/alacritty"
  symlink "$HOME/dotfiles/terminal/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
fi

if on_mac; then
  package_install iterm2-nightly

  # TODO: Symlink iterm2 config.
fi
