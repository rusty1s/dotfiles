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
  package_install tar
fi

if on_arch; then
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
  apt_add_ppa "ppa:dawidd0811/neofetch-daily"
  apt_install neofetch

  apt_add_key hkp://keyserver.ubuntu.com:80 BBEBDCB318AD50EC6865090613B00F1FD2C19886
  eval_cmd "Set source" "echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list"
  apt_update_sources
  apt_install spotify-client

  apt_add_key pgp.mit.edu 5044912E
  apt_add_ppa "\"deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main\""
  apt_install dropbox

  eval_cmd "Add key" "wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -"
  eval_cmd "Set source" "echo deb http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google.list"
  apt_update_sources
  apt_install google-chrome-stable
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
