#!/bin/sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/dir.sh
. ./helper/package.sh
. ./helper/python.sh

print_header Python

if on_arch; then
  package_install python
  package_install python-pip
  package_install python2
  package_install python2-pip
fi

if on_mac; then
  package_install python
  package_install python3
fi

system_pip_update

system_pip_install pip
system_pip_install virtualenv

version="3.6"
make_dir "$HOME/.venv"
python_virtualenv_create "$HOME/.venv/$version" "$version"
python_virtualenv_activate "$HOME/.venv/$version"

pip_update

pip_install pip
pip_install jedi
pip_install yapf
pip_install pep8
pip_install flake8
pip_install nose
pip_install coverage
pip_install numpy
pip_install numpy-groupies
pip_install scipy
pip_install tensorflow
pip_install ipython
pip_install jupyter
pip_install matplotlib
pip_install networkx
pip_install scikit-image
pip_install scikit-learn
