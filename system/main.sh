#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/pacaur.sh
. ./helper/brew.sh

print_header System

package_update

package_install wget
package_install curl
package_install unzip
package_install ripgrep
package_install shellcheck
package_install ranger
package_install ruby

if ! on_mac; then
  package_install zip
  package_install xclip
fi

if on_arch; then
  install_pacaur
  pacaur_update

  pacaur_install neofetch
fi

if on_mac; then
  package_install neofetch
  package_install duti  # Set default applications for file types.

  brew_tap "caskroom/cask"
  brew_tap "caskroom/fonts"

  brew_cask_update

  # Mac only applications.
  brew_cask_install discord
  brew_cask_install league-of-legends
  brew_cask_install the-unarchiver
fi