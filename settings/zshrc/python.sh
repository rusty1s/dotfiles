#!/bin/sh

# Python virtual environment.
if ! which virtualenv >/dev/null; then
  sudo pip install virtualenv
fi

if [ ! -d ~/venv ]; then
  virtualenv --python=python3.6 ~/venv
  . ~/venv/bin/activate
  pip install -r ~/dotfiles/zshrc/requirements.txt
else
  . ~/venv/bin/activate
fi
