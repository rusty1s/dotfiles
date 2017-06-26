#!/bin/sh

ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

function linebreak() {
  printf "\n"
}

function header() {
  width=$(tput cols)
  len=${#1}
  sep=$((width - len - 11))

  linebreak
  printf "$COL_CYAN######### $1 "
  printf "%0.s#" $(seq 1 $sep)
  printf "$COL_RESET\n"
  linebreak
}

function running() {
  printf "$COL_MAGENTA[running]$COL_RESET $1"
}

function ok() {
  printf "\r\033[K$COL_GREEN[ok]$COL_RESET      $1\n"
}

function error() {
  printf "\r\033[K$COL_RED[error]$COL_RESET   $1\n\n"
  printf "$2\n"
  exit 1
}
