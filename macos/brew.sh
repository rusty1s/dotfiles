#!/bin/sh

if test ! "$(which brew)"; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

brew install git
brew install zsh zsh-completions
brew install node
npm install -g npm@latest
brew install yarn
brew install ripgrep
brew install duti  # Set default applications for file types.

brew install python
pip install --upgrade distribute
pip install --upgrade pip
pip install virtualenv

brew install python3
pip3 install --upgrade pip
pip3 install --upgrade distribute
pip3 install virtualenv

brew tap neovim/neovim
brew install neovim

brew install tmux
# pbcopy broken in tmux under sierra
brew install reattach-to-user-namespace

brew tap caskroom/fonts
brew cask install font-fira-code
brew cask install font-humor-sans

brew tap caskroom/cask
brew cask install google-chrome
brew cask install 1password
brew cask install spotify
brew cask install dropbox
brew cask install whatsapp
brew cask install hyper
brew cask install iterm2-nightly
brew cask install marked
duti -s com.bretterpstra.marked2 .md all
brew cask install discord
brew cask install league-of-legends
brew cask install mactex
