#!/bin/sh

brew install wget
brew install ripgrep
brew install unzip
brew install shellcheck
brew install neofetch
brew install duti

brew tap homebrew/casks
brew tap caskroom/versions

brew cask install iterm2-nightly
brew cask install spotify
brew cask install dropbox
brew cask install bartender
brew cask install skim
brew cask install marked
brew cask install the-unarchiver
brew cask install filezilla
brew cask install bitbar

duti -s net.sourceforge.skim-app.skim .pdf all
duti -s com.brettterpstra.marked2 .md all
