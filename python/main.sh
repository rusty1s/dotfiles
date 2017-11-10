#!/bin/sh

. ./vars.sh

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

if on_ubuntu; then
  package_install python
  package_install python-pip
  package_install python3
  package_install python3-pip
fi

if on_mac; then
  package_install python
  package_install python3
fi

system_pip_update

system_pip_install pip
system_pip_install virtualenv

make_dir "$PYTHON_VENV"
python_virtualenv_create "$PYTHON_VENV/$PYTHON_VERSION" "$PYTHON_VERSION"
python_virtualenv_activate "$PYTHON_VENV/$PYTHON_VERSION"

pip_update

pip_install pip
pip_install jedi
pip_install yapf
pip_install pep8
pip_install flake8
pip_install vim-vint
pip_install nose
pip_install coverage
pip_install numpy
pip_install numpy-groupies
pip_install scipy
pip_install ipython
pip_install jupyter
pip_install matplotlib
pip_install networkx
pip_install scikit-image
pip_install scikit-learn
pip_install Sphinx
