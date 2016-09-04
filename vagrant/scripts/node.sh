#!/bin/sh

echo "---"
echo "--- Installing node.js"
echo "---"

NVM_DIR="$HOME/.apps/nvm"
git clone https://github.com/creationix/nvm.git $NVM_DIR
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm install node

echo "---"
echo "--- Install global npm packages"
echo "---"

# make sure npm is up to date
npm install -g npm

npm install trash-cli -g
npm install eslint -g
npm install stylelint -g
