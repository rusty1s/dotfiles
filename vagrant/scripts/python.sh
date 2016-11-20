#!/bin/sh

echo " "
echo "##########"
echo "# PYTHON #"
echo "##########"
echo " "

sudo apt-get install -y python-pip python-dev python-doc
sudo apt-get install -y python3-pip python3-dev python3-doc

echo " "
echo "#########"
echo "# CONDA #"
echo "#########"
echo " "

if [ ! -d "$HOME/.miniconda" ]; then
  wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
  bash miniconda.sh -b -p "$HOME/.miniconda"
  rm -f miniconda.sh
else
  "$HOME/.miniconda/bin/conda" update -q conda
fi
