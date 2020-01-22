#!/bin/sh

# Expand print panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForPrintMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForPrintMode2 -bool true

# Expand save panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Keyboard
defaults write NSGlobalDomain KeyRepeat -int 1          # Set blazingly fast key repeat rate.
defaults write NSGlobalDomain InitialKeyRepeat -int 12  # Set blazingly fast initial key repeat rate.

# Disable the "Are you sure you want to open this application?" dialog.
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Always open new documents in tabs.
defaults write NSGlobalDomain AppleWindowTabbingMode always

# Text correction
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false      # Disable automatic capitalization.
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false  # Disable peroid substitution.
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false   # Disable smart quotes.
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false    # Disable smart dashes.
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false      # Disable automatic capitalization.
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false  # Disable auto-correct.
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false      # Disable text-completion.

# Finder
defaults write com.apple.finder AppleShowAllFiles -bool true                 # Show hidden files.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true              # Show all file extensions.
defaults write com.apple.finder FXEnableExtensionsChangeWarning -bool false  # Disable file extension change warning.
defaults write com.apple.finder ShowStatusBar -bool true                     # Show status bar.
defaults write com.apple.finder ShowPathbar -bool true                       # Show path bar.
defaults write com.apple.finder ShowRecentTags -bool false                   # Hide tags in sidebar.
defaults write com.apple.finder QuitMenuItem -bool true                      # Allow quitting finder via ⌘ + Q.
defaults write com.apple.finder SidebarWidth -int 175                        # Greater sidebar width.
defaults write com.apple.finder WarnOnEmptyTrash -bool false                 # No warning before emptying trash.

# Set search scope.
# This Mac       : `SCev`
# Current Folder : `SCcf`
# Previous Scope : `SCsp`
defaults write com.apple.finder FXDefaultSearchScope SCcf

# Set preferred view style.
# Icon View   : `icnv`
# List View   : `Nlsv`
# Column View : `clmv`
# Cover Flow  : `Flwv`
defaults write com.apple.finder FXPreferredViewStyle clmv
rm -rf ~/.DS_Store

# Set default path for new windows.
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other…       : `PfLo`
defaults write com.apple.finder NewWindowTarget PfHm
killall Finder

# Use plain text mode for new TextEdit documents.
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit.
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
