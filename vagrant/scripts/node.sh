#!/bin/sh

echo "---"
echo "--- Installing node.js"
echo "---"

git clone https://github.com/creationix/nvm.git $HOME/.config/nvm

. "$HOME/.config/nvm/nvm.sh"

nvm install node

echo "---"
echo "--- Install global npm packages"
echo "---"

npm install trash-cli -g
