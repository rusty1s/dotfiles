#!/bin/zsh

export TERM="xterm-256color-italic"

alias cask="brew cask"

# Python 3 Virtualenv.
if [ -d /usr/local/lib/python3.6 ]; then
  alias virtualenv3="python3 /usr/local/lib/python3.6/site-packages/virtualenv.py"

  if [ ! -d ~/venv ]; then
    virtualenv3 ~/venv
    . ~/venv/bin/activate
    pip install -r ~/dotfiles/zshrc/requirements.txt
    pip install neovim
    pip install tensorflow
  else
    . ~/venv/bin/activate
  fi
fi

source ~/dotfiles/zshrc/base.zsh
