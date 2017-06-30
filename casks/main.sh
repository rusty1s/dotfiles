#!/bin/sh

. ./helper/os.sh

if on_mac; then
  . ./helper/brew.sh

  brew_tap "caskroom/fonts"
  brew_tap "caskroom/cask"

  brew_cask_update
fi
