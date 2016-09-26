#!/bin/bash

echo " "
echo "########"
echo "# NODE #"
echo "########"
echo " "

nvm_path="$HOME/.nvm"

git-get creationix/nvm "$nvm_path"
source "$nvm_path/nvm.sh"

nvm install node

# VERSION=5

# mkdir "$HOME/.npm-packages"
# ln -sf "$HOME/dotfiles/node/npmrc" "$HOME/.npmrc"

# curl -sL "https://deb.nodesource.com/setup_${VERSION}.x" | sudo -E bash -
# sudo apt-get install -y nodejs

echo " "
echo "################"
echo "# NPM PACKAGES #"
echo "################"
echo " "

sudo npm install -g trash-cli
sudo npm install -g eslint
sudo npm install -g stylelint
