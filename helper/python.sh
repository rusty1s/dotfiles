#!/bin/sh

. ./helper/cmd.sh
. ./helper/dir.sh

pip_update() {
  name="Update pip packages"
  eval_cmd "$name" "pip list --outdated --format=freeze | xargs -n1 pip install --upgrade"
}

pip_install() {
  name="Install $1"
  eval_cmd "$name" "pip install --upgrade $1"
}

python_virtualenv_create() {
  python_virtualenv_deactivate

  if [ ! -d "$1" ]; then
    name="Create virtual environment"
    eval_cmd "$name" "virtualenv --python=python$2 $1"
  fi
}

python_virtualenv_activate() {
  python_virtualenv_deactivate

  if [ -f "$1/bin/activate" ]; then
    name="Activate virtual environment"
    print_running "$name"
    # shellcheck source=/dev/null
    . "$1/bin/activate"
    clear_lines 2
    print_ok "$name"
  fi
}

python_virtualenv_deactivate() {
  if cmd_exists deactivate; then
    name="Deactivate virtual environment"
    print_running "$name"
    deactivate
    clear_lines 2
    print_ok "$name"
  fi
}
