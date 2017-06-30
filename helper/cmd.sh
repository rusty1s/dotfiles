#!/bin/bash

. ./helper/echos.sh

cmd_exists() {
  command -v "$1" > /dev/null 2>&1
}

eval_cmd() {
  print_running "$1"

  eval "$2" 2> /tmp/error |
    while IFS= read -r line; do
      clear_line
      printf "%s" "$line"
    done

  status=${PIPESTATUS[0]}

  clear_prev_line
  if [ "$status" -ne 0 ]; then
    print_error "$1" "$(cat /tmp/error)"
    exit 1
  else
    print_ok "$1"
  fi
}
