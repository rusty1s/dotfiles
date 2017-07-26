#!/bin/sh

. ./helper/echos.sh
. ./helper/cmd.sh

ask_for_sudo() {
  print_running_inline
  eval "sudo -v"
  clear_lines 2
  eval "while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &"
}
