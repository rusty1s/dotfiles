#!/bin/bash

echo " "
echo "########"
echo "# NODE #"
echo "########"
echo " "

nvm_path="$HOME/.nvm"

if [ ! -d "$nvm_path" ]; then
  git clone https://github.com/creationix/nvm.git "$nvm_path"
else
  cd "$nvm_path" || exit
  git pull
fi

# shellcheck source=/dev/null
. "$nvm_path/nvm.sh"

nvm install node
