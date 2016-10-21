#!/usr/bin/env bash

# ask for the administrator password upfront
sudo -v

# close system preferences panes
osascript -e 'tell application "System Preferences" to quit'

echo ""
echo "########"
echo "# Base #"
echo "########"
echo ""

read -p "Would you like to set your computer name? [y/N] " -n 1 -r -t 10
echo

if [[ "$REPLY" =~ ^[Yy]$ ]]; then
  echo "What would you like it to be?"
  read COMPUTER_NAME

  sudo scutil --set ComputerName $COMPUTER_NAME
  sudo scutil --set HostName $COMPUTER_NAME
  sudo scutil --set LocalHostName $COMPUTER_NAME
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME
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

echo "Disable notification center and remove the menu bar icon"
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null
# TODO: Icon is still there

echo "Disable \"natural\" scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo "Set a faster keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 12

echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "Disable smart quotes and smart dashes? (y/n)"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo
echo "##########"
echo "# FINDER #"
echo "##########"
echo

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

echo "Use list view in all finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# TODO: geht nicht

echo "Show the ~/Library folder"
chflags nohidden ~/Library

echo "Show the /Volumes folder"
sudo chflags nohidden /Volumes

echo ""
echo "############"
echo "# Trackpad #"
echo "############"
echo ""

echo "Enable tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Map bottom right corner to right-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

echo ""
echo "#############"
echo "# SPOTLIGHT #"
echo "#############"
echo ""

echo "Hide the Spotlight icon? (y/n)"
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

echo ""
echo "########"
echo "# DOCK #"
echo "########"
echo

echo "Disable the warning before emptying the trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

echo "Automatically hide and show the dock"
defaults write com.apple.dock autohide -bool true

echo "Remove the auto-hide dock delay"
defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

echo ""
echo "##########"
echo "# SAFARI #"
echo "##########"
echo

echo "Don't send search queries to apple"
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

echo "Enable the develop menu and the web inspector in safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

echo "Add a context menu item for showing the web inspector"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
# TODO: geht nicht

echo "Making Safari's search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo
echo "########"
echo "# MAIL #"
echo "########"
echo

echo "Copy email addresses as `foo@example.com`"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

echo "Force all mail messages to display as plain text"
defaults write com.apple.mail PreferPlainText -bool true

echo
echo "############"
echo "# TEXTEDIT #"
echo "############"
echo

echo "Use plain text mode for new documents"
defaults write com.apple.TextEdit RichText -int 0

echo "Open and save files as utf-8"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

echo
echo "##########"
echo "# ITUNES #"
echo "##########"
echo

echo "Stop iTunes from responding to the keyboard media keys"
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

echo
echo "##########"
echo "# PHOTOS #"
echo "##########"
echo

echo "Disable Photos from starting everytime a device is plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

echo
echo "#########"
echo "# ITERM #"
echo "#########"
echo

echo "Don't display the annoying prompt when quitting iTerm"
defaults write com.googlecode.iterm2 PromptOnQuit -bool false



# echo ""
# echo "Hide the Time Machine, Volume, User, and Bluetooth icons?  (y/n)"
# read -r response
# if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
# # Get the system Hardware UUID and use it for the next menubar stuff
# for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
# defaults write "${domain}" dontAutoLoad -array \
# "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
# "/System/Library/CoreServices/Menu Extras/Volume.menu" \
# "/System/Library/CoreServices/Menu Extras/User.menu"
# done

# defaults write com.apple.systemuiserver menuExtras -array \
# "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
# "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
# "/System/Library/CoreServices/Menu Extras/Battery.menu" \
# "/System/Library/CoreServices/Menu Extras/Clock.menu"
# fi

# echo "Wipe all (default) app icons from the Dock? (y/n)"
# echo "(This is only really useful when setting up a new Mac, or if you don't use the Dock to launch apps.)"
# read -r response
# if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
# defaults write com.apple.dock persistent-apps -array
# fi

# echo "Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
# defaults write com.apple.dock tilesize -int 36

# # increase grid spacing for icons on the desktop and in other icon views
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# increase the size of icons on the desktop and in other icon views
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

# todo: remap ctrl to caps
# todo: remap private mode to ctrl+e in safari
# set profile picture
# adblock
# finder seitenliste konfigurieren
# spotlight prio liste
