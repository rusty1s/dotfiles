#!/bin/sh

. ./helper/echos.sh
. ./helper/cmd.sh

ask_for_sudo() {
  sudo -nv > /dev/null 2>&1
  cached=$?

  if [ "$cached" -ne 0 ]; then
    print_running_inline "Administration "
    eval "sudo -v"
    clear_lines 2
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
  fi
}
