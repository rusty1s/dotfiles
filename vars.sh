#!/bin/sh

. ./helper/os.sh

export COMPUTER_NAME="rusty1s"

export DOTFILES="$HOME/dotfiles"

export PYTHON_VENV="$HOME/.venv"

if ! on_ubuntu; then
  export PYTHON_VERSION="3.6"
else
  export PYTHON_VERSION="3.5"
fi

export RUBY_VERSION="2.4.1"
