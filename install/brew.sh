#!/bin/sh

if test ! $(which brew); then
  echo "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Update homebrew"
  brew update
fi

echo "Installing homebrew packages..."

# zsh
brew install zsh
# brew install zsh-syntax-highlighting
# brew install zsh-autosuggestions

# git
brew install git

# vim
brew install vim --with-lua

# neovim
brew tap neovim/neovim
brew install --HEAD neovim
brew install python3
pip3 install --upgrade neovim

# tmux
brew install tmux
