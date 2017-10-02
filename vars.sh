#!/bin/sh

export COMPUTER_NAME="rusty1s"

export DOTFILES="$HOME/dotfiles"

export PYTHON_VENV="$HOME/.venv"

if uname -a | grep -qi "ubuntu"; then
  export PYTHON_VERSION="3.5"
else
  export PYTHON_VERSION="3.6"
fi
