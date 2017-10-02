#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/package.sh
. ./helper/pacaur.sh
. ./helper/brew.sh
. ./helper/apt.sh
. ./helper/cargo.sh
. ./helper/cmd.sh

print_header System

if on_mac; then
  install_brew
fi

package_update
 
package_install wget
package_install curl
package_install unzip
 
package_install shellcheck
package_install ranger
package_install ruby
package_install thefuck

if ! on_ubuntu; then
  package_install ripgrep
else
  install_cargo
  cargo_install ripgrep
fi

if ! on_mac; then
  package_install zip
  package_install xclip
fi

if on_arch; then
  package_install tar

  install_pacaur
  pacaur_update

  pacaur_install neofetch

  # Applications.
  package_install thunar
  pacaur_install bash-pipes
  pacaur_install thunar-vcs-plugin
  pacaur_install arc-gtk-theme
  pacaur_install paper-icon-theme
  pacaur_install google-chrome
  pacaur_install spotify
  pacaur_install dropbox
  pacaur_install whatsapp-web-desktop
  pacaur_install filezilla
fi

if on_ubuntu; then
  apt_add_ppa "dawidd0811/neofetch-daily"
  apt_install neofetch
fi

if on_mac; then
  package_install neofetch

  brew_tap "caskroom/cask"
  brew_tap "caskroom/fonts"

  brew_cask_update

  # Applications.
  brew_cask_install google-chrome
  brew_cask_install spotify
  brew_cask_install dropbox
  brew_cask_install whatsapp
  brew_cask_install marked
  package_install duti  # Set default applications for file types.
  eval_cmd "Set default application for markdown" "duti -s com.bretterpstra.marked2 .md all"
  brew_cask_install vlc
  brew_cask_install discord
  brew_cask_install league-of-legends
  brew_cask_install the-unarchiver
  brew_cask_install filezilla
  brew_cask_install virtualbox
fi
