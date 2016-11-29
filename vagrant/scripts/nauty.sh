#!/bin/sh

echo " "
echo "#########"
echo "# NAUTY #"
echo "#########"
echo " "

nauty="nauty26r7"
pynauty="pynauty-0.6.0"

if [ ! -d "$HOME/.sources/pynauty" ]; then
  wget "https://web.cs.dal.ca/~peter/software/pynauty/$pynauty.tar.gz"
  tar xvzf "$pynauty.tar.gz"
  rm -f "$pynauty.tar.gz"
  mkdir -p "$HOME/.sources"
  mv $pynauty "$HOME/.sources/pynauty"

  wget "http://pallini.di.uniroma1.it/$nauty.tar.gz"
  tar xvzf "$nauty.tar.gz"
  rm -f "$nauty.tar.gz"
  mv $nauty "$HOME/.sources/pynauty/nauty"
fi

cd "$HOME/.sources/pynauty" || exit
make pynauty
make user-ins

python3 setup.py build
sudo python3 setup.py install
