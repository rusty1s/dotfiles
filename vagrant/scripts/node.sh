#!/bin/sh

echo " "
echo "########"
echo "# NODE #"
echo "########"
echo " "

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

echo " "
echo "#######################"
echo "# GLOABL NPM PACKAGES #"
echo "#######################"
echo " "

# sudo npm install -g npm

# sudo npm install trash-cli -g
# sudo npm install eslint -g
# sudo npm install stylelint -g
