#!/bin/sh

. ./helper/cmd.sh

computer_name() {
  name="Set computer name to $1"

  cmd1="sudo scutil --set ComputerName $1"
  cmd2="sudo scutil --set HostName $1"
  cmd3="sudo scutil --set LocalHostName $1"
  cmd4="sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string \"$1\""

  eval_cmd "$name" "$cmd1;$cmd2;$cmd3;$cmd4"
}

expand_save_panel() {
  name="Expand save panel by default"
  cmd1="defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true"
  cmd2="defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true"
  eval_cmd "$name" "$cmd1;$cmd2"
}

expand_print_panel() {
  name="Expand print panel by default"
  cmd1="defaults write NSGlobalDomain NSNavPanelExpandedStateForPrintMode -bool true"
  cmd2="defaults write NSGlobalDomain NSNavPanelExpandedStateForPrintMode2 -bool true"
  eval_cmd "$name" "$cmd1;$cmd2"
}

quit_printer_automatically() {
  name="Automatically quit printer app once jobs complete"
  cmd="defaults write com.apple.print.PrintingPrefs \"Quit When Finished\" -bool true"
  eval_cmd "$name" "$cmd"
}

disable_open_app_confirm_dialog() {
  name="Disable the open application confirm dialog"
  cmd="defaults write com.apple.LaunchServices LSQuarantine -bool false"
  eval_cmd "$name" "$cmd"
}

disable_natural_scrolling() {
  name="Disable \"natural scrolling\""
  cmd="defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false"
  eval_cmd "$name" "$cmd"
}

set_faster_keyboard_repeat_rate() {
  name="Set a faster keyboard repeat rate"
  cmd1="defaults write NSGlobalDomain KeyRepeat -int 1"
  cmd2="defaults write NSGlobalDomain InitialKeyRepeat -int 10"
  eval_cmd "$name" "$cmd1;$cmd2"
}

disable_autocorrect() {
  name="Disable auto-correct"
  cmd="defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false"
  eval_cmd "$name" "$cmd"
}

disable_smart_quotes() {
  name="Disable smart quotes and smart dashes"
  cmd1="defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false"
  cmd2="defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false"
  eval_cmd "$name" "$cmd1;$cmd2"
}

search_current_folder_first() {
  name="Search the current folder by default"
  cmd="defaults write com.apple.finder FXDefaultSearchScope -string \"SCcf\""
  eval_cmd "$name" "$cmd"
}

show_hidden_files() {
  name="Show hidden files by default"
  cmd="defaults write com.apple.finder AppleShowAllFiles -bool true"
  eval_cmd "$name" "$cmd"
}

show_all_file_extensions() {
  name="Show all filename extensions"
  cmd="defaults write NSGlobalDomain AppleShowAllExtensions -bool true"
  eval_cmd "$name" "$cmd"
}

disable_change_file_extension_warning() {
  name="Disable the warning when changing a file extension"
  cmd="defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false"
  eval_cmd "$name" "$cmd"
}
