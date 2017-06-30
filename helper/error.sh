#!/bin/bash

. ./helper/echos.sh

error_exit() {
  print_running "$1"
  clear_prev_line
  print_error "$1" "$2"
  exit 1
}
