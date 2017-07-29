#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/brew.sh
. ./helper/symlink.sh

print_header Terminal

if on_arch; then
  package_install rxvt-unicode

  symlink "$DOTFILES/terminal/.Xresources" "$HOME/.Xresources"
fi

if on_mac; then
  brew_cask_install iterm2-nightly

  # TODO: Symlink iterm2 config.
fi
