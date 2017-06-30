#!/bin/bash

. ./helper/echos.sh

error_exit() {
  print_running "$1"
  clear_lines 2
  print_error "$1" "$2"
  exit 1
}
