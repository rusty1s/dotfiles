#!/bin/sh

on_arch() {
  if uname -a | grep -qi "arch"; then
    return 0
  else
    return 1
  fi
}

on_ubuntu() {
  # TODO
  return 1
}

on_mac() {
  if uname | grep -qi "darwin"; then
    return 0
  else
    return 1
  fi
}
