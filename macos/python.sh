#!/bin/sh

export VIRTUAL_ENV_DISABLE_PROMPT=1
if [ -d /usr/local/lib/python3.6 ]; then
  alias virtualenv3="python3 /usr/local/lib/python3.6/site-packages/virtualenv.py"

  if [ ! -d ~/venv ]; then
    virtualenv3 ~/venv
    source ~/venv/bin/activate
    pip install neovim
    pip install jedi
    pip install yapf
    pip install pep8
    pip install flake8
    pip install nose -I
    pip install numpy
    pip install scipy
    pip install tensorflow
  else
    source ~/venv/bin/activate
  fi
fi

