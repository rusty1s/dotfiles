#!/bin/sh

brew install ical-buddy

PLIST="io.rusty1s.ical.plist"
ln -sf "$HOME/dotfiles/widgets/calendar/$PLIST" "$HOME/Library/LaunchAgents/$PLIST"
launchctl load -w "$HOME/Library/LaunchAgents/$PLIST"
sh "$HOME/dotfiles/widgets/calendar/ical.sh"
