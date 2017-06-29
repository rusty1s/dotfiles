#!/bin/sh

function on_arch() {
  if uname -a | grep -qi "arch"; then
    return 0
  else
    return 1
  fi
}

function on_mac() {
  if uname | grep -qi "darwin"; then
    return 0
  else
    return 1
  fi
}
