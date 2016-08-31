#!/bin/sh

if test ! $(which brew); then
  echo "Installing homebrew..."

  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew tap caskroom/cask
  brew tap caskroom/fonts
else
  echo "Updating homebrew..."

  brew update
fi

echo "Installing homebrew packages..."

# git
brew install git

echo "Installing homebrew cask applications..."

brew cask install iterm2
brew cask install virtualbox
brew cask install vagrant

brew cask install texpad
brew cask install tower

brew cask install google-chrome
brew cask install chrome-devtools

brew cask install spotify
brew cask install dropbox
brew cask install whatsapp

brew cask install skype

echo "Installing homebrew cask fonts"

brew cask install font-dejavu-sans-mono-for-powerline
