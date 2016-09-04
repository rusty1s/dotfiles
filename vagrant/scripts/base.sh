#!/bin/sh

echo "---"
echo "--- Installing Base Packages"
echo "---"

sudo apt-get update

# enable the use of the add-apt-repository
sudo apt-get install -y software-properties-common

sudo apt-get install -y tar tar-doc
