#!/bin/sh

APP="Spotify"
NERD_FONT="SFUIText Nerd Font"

print() {
  echo "$1  $2 | font='$NERD_FONT' terminal=false $3"
}

BitBarDarkMode=${BitBarDarkMode}
if [ "$BitBarDarkMode" ]; then
  GRAY="#666666"
else
  GRAY="#333333"
fi

if [ "$1" = "playpause" ]; then
  osascript -e "tell application \"$APP\" to playpause"
  exit
fi

if [ "$1" = "previous" ]; then
  osascript -e "tell application \"$APP\" to previous track"
  exit
fi

if [ "$1" = "next" ]; then
  osascript -e "tell application \"$APP\" to next track"
  exit
fi

if [ "$1" = "activate" ]; then
  osascript -e "tell application \"$APP\" to activate"
  exit
fi

if [ "$1" = "quit" ]; then
  osascript -e "tell application \"$APP\" to quit"
  exit
fi

APP_STATE=$(osascript -e "application \"$APP\" is running")

if [ "$APP_STATE" = "false" ]; then
  print ""
  echo "---"
  print "" "Activate $APP" "bash='$0' param1=activate"
else
  APP_PLAYING=$(osascript ~/dotfiles/bitbar/spotify/state.scpt)
  TRACK=$(osascript ~/dotfiles/bitbar/spotify/track.scpt)

  if [ "$APP_PLAYING" = "paused" ]; then
    print "  " "$TRACK" "color=$GRAY"
    echo "---"
    print "" "Play" "bash='$0' param1=playpause"
  else
  print "  " "$TRACK"
    echo "---"
    print "" "Pause" "bash='$0' param1=playpause"
  fi

  print "" "Previous" "bash='$0' param1=previous"
  print "" "Next" "bash='$0' param1=next"
  echo "---"
  print "" "Activate $APP" "bash='$0' param1=activate"
  print "" "Quit $APP" "bash='$0' param1=quit"
fi
