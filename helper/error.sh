#!/bin/bash

. ./helper/echos.sh

error_exit() {
  print_error "$1" "$2"
  exit 1
}
