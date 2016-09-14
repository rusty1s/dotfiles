#!/bin/sh

echo " "
echo "#########"
echo "# LATEX #"
echo "#########"
echo " "

sudo add-apt-repository ppa:texlive-backports/ppa
sudo apt-get update
sudo apt-get install -y texlive-full
