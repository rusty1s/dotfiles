#!/bin/sh

defaults write com.apple.menuextra.clock DateFormat HH:mm:ss         # Set clock format.
defaults write NSGlobalDomain AppleLanguage -array "en-DE" "de-DE"  # Set system language.

defaults write com.apple.dock autohide -bool true       # Autohide dock.
defaults write com.apple.dock tilesize -int 64          # Set dock icon size.
defaults write com.apple.dock magnification -bool true  # Enable dock magnification.
defaults write com.apple.dock largesize -int 96         # Set dock magnificated icon size.
defaults write NSGlobalDomain AppleInterfaceStyle Dark  # Use dark menu bar and dock.

killall Dock

# Expand print panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForPrintMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForPrintMode2 -bool true

# Expand save panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Enable tap to click.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Keyboard
defaults write NSGlobalDomain KeyRepeat -int 1          # Set blazingly fast key repeat rate.
defaults write NSGlobalDomain InitialKeyRepeat -int 12  # Set blazingly fast initial key repeat rate.

# Disable the "Are you sure you want to open this application?" dialog.
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable "natural" scrolling.
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Text correction
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false      # Disable automatic capitalization.
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false  # Disable peroid substitution.
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false   # Disable smart quotes.
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false    # Disable smart dashes.
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false      # Disable automatic capitalization.
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false  # Disable auto-correct.
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false      # Disable text-completion.

# Finder
defaults_enable com.apple.finder AppleShowAllFiles  # Show hidden files.
defaults_enable NSGlobalDomain AppleShowAllExtensions  # Show all file extensions.
defaults_disable com.apple.finder FXEnableExtensionsChangeWarning  # Disable file extension change warning.
defaults_enable com.apple.finder ShowStatusBar  # Show status bar.
defaults_enable com.apple.finder ShowPathbar  # Show path bar.
defaults_disable com.apple.finder ShowRecentTags  # Hide tags in sidebar.
defaults_enable com.apple.finder QuitMenuItem  # Allow quitting finder via ⌘ + Q.
defaults_set_int com.apple.finder SidebarWidth 175  # Greater sidebar width.
defaults_disable com.apple.finder WarnOnEmptyTrash  # No warning before emptying trash.
# Set search scope.
# This Mac       : `SCev`
# Current Folder : `SCcf`
# Previous Scope : `SCsp`
defaults_set com.apple.finder FXDefaultSearchScope SCcf
# Set preferred view style.
# Icon View   : `icnv`
# List View   : `Nlsv`
# Column View : `clmv`
# Cover Flow  : `Flwv`
defaults_set com.apple.finder FXPreferredViewStyle clmv
rm -rf ~/.DS_Store
# Set default path for new windows.
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other…       : `PfLo`
defaults_set com.apple.finder NewWindowTarget PfHm

# Quit printer
# Photos and iTunes
