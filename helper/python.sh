#!/bin/sh

. ./helper/echos.sh
. ./helper/cmd.sh
. ./helper/dir.sh

system_pip_update() {
  name="Update system pip packages"

  if [ -f /usr/bin/pip ]; then
    eval_cmd "$name" "/usr/bin/pip list --outdated --format=freeze | xargs -n1 pip install --upgrade"
  elif [ -f /usr/local/bin/pip3 ]; then
    eval_cmd "$name" "/usr/local/bin/pip3 list --outdated --format=freeze | xargs -n1 /usr/local/bin/pip3 install --upgrade"
  else
    print_error "$name" "Could not find system pip package"
    exit 1
  fi
}

system_pip_install() {
  name="Install system $1"

  if [ -f /usr/bin/pip ]; then
    eval_cmd "$name" "sudo /usr/bin/pip install --upgrade $1"
  elif [ -f /usr/local/bin/pip3 ]; then
    eval_cmd "$name" "/usr/local/bin/pip3 install --upgrade $1"
  else
    print_error "$name" "Could not find system pip package"
    exit 1
  fi
}

pip_update() {
  name="Update pip packages"
  eval_cmd "$name" "pip list --outdated --format=freeze | xargs -n1 pip install --upgrade"
}

pip_install() {
  name="Install $1"
  eval_cmd "$name" "pip install --upgrade $1"
}

python_virtualenv_create() {
  name="Create virtual python $2 environment"

  if [ ! -d "$1" ]; then
    if [ -f /usr/bin/virtualenv ]; then
      eval_cmd "$name" "/usr/bin/virtualenv --python=python$2 $1"
    elif [ -f /usr/local/bin/virtualenv ]; then
      eval_cmd "$name" "/usr/local/bin/virtualenv --python=python$2 $1"
    else
      print_error "$name" "Could not find system virtualenv package"
      exit 1
    fi
  fi
}

python_virtualenv_activate() {
  name="Activate virtual environment"
  eval_cmd "$name" ". $1/bin/activate"

  # shellcheck source=/dev/null
  . "$1/bin/activate"
}
