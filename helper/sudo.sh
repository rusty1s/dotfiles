#!/bin/sh

. ./helper/echos.sh
. ./helper/cmd.sh

ask_for_sudo() {
  print_running_inline "Administration "
  eval "sudo -v"
  clear_line
  eval "while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &"
}
