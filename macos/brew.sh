#!/bin/sh

if test ! "$(which brew)"; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

brew install git
brew install zsh zsh-completions
brew install node
brew install python3

brew tap neovim/neovim
brew install neovim

brew install tmux
brew install ripgrep

brew tap caskroom/fonts
brew cask install font-fira-code

brew tap caskroom/cask
brew cask install google-chrome
brew cask install 1password
brew cask install spotify
brew cask install dropbox
brew cask install whatsapp
brew cask install hyper
brew cask install discord
brew cask install league-of-legends
