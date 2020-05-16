#!/bin/sh

brew install wget
brew install ripgrep
brew install unzip
brew install shellcheck
brew install neofetch
brew install duti
brew install clang-format

brew cask install iterm2
brew cask install spotify
brew cask install dropbox
brew cask install bartender
brew cask install skim
brew cask install marked
brew cask install the-unarchiver
# brew cask install bitbar
brew cask install whatsapp
brew cask install basictex
brew cask install latexit
brew cask install skim

duti -s net.sourceforge.skim-app.skim .pdf all
duti -s com.brettterpstra.marked2 .md all

# Install all LaTex packages.
export PATH="/Library/TeX/texbin:$PATH"
sudo tlmgr update --self
sudo tlmgr install scheme-full
