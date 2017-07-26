#!/bin/sh

ESC_SEQ="\x1b["
COL_RESET="${ESC_SEQ}39;49;00m"
COL_RED="${ESC_SEQ}31;01m"
COL_GREEN="${ESC_SEQ}32;01m"
# COL_YELLOW="${ESC_SEQ}33;01m"
# COL_BLUE="${ESC_SEQ}34;01m"
COL_MAGENTA="${ESC_SEQ}35;01m"
COL_CYAN="${ESC_SEQ}36;01m"

clear_line() {
  printf "\r\033[K"
}

clear_lines() {
  clear_line
  for _ in $(seq 2 "$1"); do
    tput cuu1
    clear_line
  done
}

print_header() {
  count=$(($(tput cols) - ${#1} - 11))

  printf "\n%b######### %s " "$COL_CYAN" "$1"
  printf "%0.s#" $(seq 1 $count)
  printf "%b\n\n" "$COL_RESET"
}

print_running_inline() {
  printf "%b[running]%b %s" "$COL_MAGENTA" "$COL_RESET" "$1"
}

print_running() {
  print_running_inline "$1"
  printf "\n"
}

print_ok() {
  printf "%b[ok]%b      %s\n" "$COL_GREEN" "$COL_RESET" "$1"
}

print_error() {
  printf "%b[error]%b   %s\n\n%s\n" "$COL_RED" "$COL_RESET" "$1" "$2"
}
