#!/bin/sh

. ./helper/cmd.sh

defaults_enable() {
  name="Enable $2"
  eval_cmd "$name" "defaults write $1 $2 -int 1"
}

defaults_disable() {
  name="Disable $2"
  eval_cmd "$name" "defaults write $1 $2 -int 0"
}

defaults_set() {
  name="Set $2 to $3"
  eval_cmd "$name" "defaults write $1 $2 $3"
}

defaults_set_int() {
  name="Set $2 to $3"
  eval_cmd "$name" "defaults write $1 $2 -int $3"
}

quit_printer_automatically() {
  name="Automatically quit printer app once jobs complete"
  cmd="defaults write com.apple.print.PrintingPrefs \"Quit When Finished\" -bool true"
  eval_cmd "$name" "$cmd"
}

itunes_disable_media_keys() {
  name="Stop iTunes from responding to the keyboard media keys"
  cmd="launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null"
  eval_cmd "$name" "$cmd"
}

photos_disable_autostart() {
  name="Disable Photos from starting everytime a device is plugged in"
  cmd="defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true"
  eval_cmd "$name" "$cmd"
}
