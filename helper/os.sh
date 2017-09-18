#!/bin/sh

on_os() {
  if uname -a | grep -qi "$1"; then
    return 0
  else
    return 1
  fi
}

on_arch() {
  on_os "arch"
}

on_ubuntu() {
  on_os "ubuntu"
}

on_mac() {
  on_os "darwin"
}
