#!/bin/sh

echo " "
echo "#########"
echo "# LATEX #"
echo "#########"
echo " "

sudo add-apt-repository ppa:texlive-backports/ppa 2>&1 /dev/null
sudo apt-get update
sudo apt-get install -y texlive-full
