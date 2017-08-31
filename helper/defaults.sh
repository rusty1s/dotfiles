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

disable_sleep_mode() {
  name="Never go into computer sleep mode"
  cmd="sudo systemsetup -setcomputersleep Off > /dev/null"
  eval_cmd "$name" "$cmd"
}

system_language() {
  name="Set system language"
  cmd1="defaults write NSGlobalDomain AppleLanguages -array \"de\""
  cmd2="defaults write NSGlobalDomain AppleLocale -string \"de_DE@currency=EUR\""
  cmd4="defaults write NSGlobalDomain AppleMeasurementUnits -string \"Centimeters\""
  cmd4="defaults write NSGlobalDomain AppleMetricUnits -bool true"
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

show_scrollbars_only_when_scrolling() {
  name="Only show scrollbars when scrolling"
  cmd="defaults write NSGlobalDomain AppleShowScrollBars -string \"WhenScrolling\""
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

disable_hold_for_accents() {
  name="No press and hold for accents"
  cmd="defaults write -g ApplePressAndHoldEnabled -bool false"
  eval_cmd "$name" "$cmd"
}

disable_automatic_capitalization() {
  name="Disable automatic capitalization"
  cmd="defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false"
  eval_cmd "$name" "$cmd"
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

avoid_ds_store_on_network() {
  name="Avoid creating .DS_Store files on network volumes"
  cmd="defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true"
  eval_cmd "$name" "$cmd"
}

show_library_folder() {
  name="Show the ~/Library folder"
  cmd="chflags nohidden ~/Library"
  eval_cmd "$name" "$cmd"
}

show_volumes_folder() {
  name="Show the /Volumes folder"
  cmd="sudo chflags nohidden /Volumes"
  eval_cmd "$name" "$cmd"
}

finder_allow_quitting() {
  name="Allow quitting Finder via ⌘ + Q"
  cmd="defaults write com.apple.finder QuitMenuItem -bool true"
  eval_cmd "$name" "$cmd"
}

mail_set_copy_format() {
  name="Copy email addresses as foo@example.com"
  cmd="defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false"
  eval_cmd "$name" "$cmd"
}

mail_show_as_plain_text() {
  name="Force all mail messages to display as plain text"
  cmd="defaults write com.apple.mail PreferPlainText -bool true"
  eval_cmd "$name" "$cmd"
}

textedit_save_as_plain_text() {
  name="Use plain text mode for new documents"
  cmd="defaults write com.apple.TextEdit RichText -int 0"
  eval_cmd "$name" "$cmd"
}

textedit_save_as_utf8() {
  name="Open and save new files as utf-8"
  cmd1="defaults write com.apple.TextEdit PlainTextEncoding -int 4"
  cmd2="defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4"
  eval_cmd "$name" "$cmd1;$cmd2"
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

terminal_disable_marks() {
  name="Disable automatic marks in Terminal.app"
  cmd="defaults write com.apple.Terminal AutoMarkPromptLines -int 0"
  eval_cmd "$name" "$cmd"
}
