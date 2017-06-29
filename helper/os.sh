#!/bin/sh

function on_arch() {
  if uname -a | grep -q "arch"; then
    return 0
  else
    return 1
  fi
}

function on_mac() {
  if uname | grep -q "Darwin"; then
    return 0
  else
    return 1
  fi
}
