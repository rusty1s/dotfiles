#!/bin/sh

echo " "
echo "########"
echo "# NODE #"
echo "########"
echo " "

# curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
# sudo apt-get install -y nodejs

if [ ! -d "$HOME/.nvm" ]; then
  git clone https://github.com/creationix/nvm.git "$HOME/.nvm"
else
  cd "$HOME/.nvm"
  git pull
fi
# cd $HOME/.nvm
# . $HOME/.nvm/nvm.sh

# nvm install node

# wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh
. $HOME/.nvm/nvm.sh

# nvm install 0.10

# chown -R vagrant:vagrant $HOME/.nvm
# export HOME=/home/root

echo " "
echo "################"
echo "# NPM PACKAGES #"
echo "################"
echo " "

# sudo npm install -g npm

# sudo npm install trash-cli -g
# sudo npm install eslint -g
# sudo npm install stylelint -g
