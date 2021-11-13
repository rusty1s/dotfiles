#!/bin/sh

export DOTFILES="$HOME/dotfiles"

brew install gpg
brew install git
brew install git-crypt
brew install wget
brew install unzip

wget "http://www.roemisch-drei.de/gpg.zip"
unzip gpg.zip
gpg --import gpg/private_key.key
gpg --import gpg/public_key.key
rm -rf gpg.zip gpg
cd ~/dotfiles && git-crypt unlock
