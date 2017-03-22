#!/bin/sh

if [ ! -d ~/.sources/nvm ]; then
  git clone https://github.com/creationix/nvm.git ~/.sources/nvm
else
  cd ~.sources/nvm || exit
  git pull
fi

source ~/.config/nvm.sh

nvm install node
npm install -g npm
npm install -g pure-prompt
