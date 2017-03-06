#!/usr/bin/env bash

# ask for the administrator password upfront
sudo -v

# close system preferences panes
osascript -e 'tell application "System Preferences" to quit'

read -p "Would you like to set your computer name? [y/N] " -n 1 -r -t 10
echo

if [[ "$REPLY" =~ ^[Yy]$ ]]; then
  echo "What would you like it to be?"
  read -r COMPUTER_NAME

  sudo scutil --set ComputerName "$COMPUTER_NAME"
  sudo scutil --set HostName "$COMPUTER_NAME"
  sudo scutil --set LocalHostName "$COMPUTER_NAME"
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$COMPUTER_NAME"
fi

echo "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

echo "Expand print panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForPrintMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForPrintMode2 -bool true

echo "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrinintingPrefs "Quit When Finished" -bool true

echo "Disable the \"Are you sure you want to open this application?\" dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Disable \"natural\" scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo "Set a faster keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 12

echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Disable smart quotes and smart dashes?"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo "Show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo "Show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Show the ~/Library folder"
chflags nohidden ~/Library

echo "Show the /Volumes folder"
sudo chflags nohidden /Volumes

echo "Copy email addresses as foo@example.com"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

echo "Force all mail messages to display as plain text"
defaults write com.apple.mail PreferPlainText -bool true

echo "Use plain text mode for new documents"
defaults write com.apple.TextEdit RichText -int 0

echo "Open and save files as utf-8"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

echo "Stop iTunes from responding to the keyboard media keys"
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

echo "Disable Photos from starting everytime a device is plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

echo "No press and hold for accents"
defaults write -g ApplePressAndHoldEnabled -bool false
