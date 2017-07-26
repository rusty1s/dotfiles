#!/bin/sh

. ./helper/cmd.sh

ask_for_sudo() {
  name="Ask for sudo"

  eval_cmd "$name" "sudo -v"
  eval "while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &"
}
