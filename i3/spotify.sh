#!/bin/sh

data=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata')

artist=$(echo "$data" | grep -A 2 "artist")  # Grep the artist block.
artist=$(echo "$artist" | grep -v "artist")  # Filter wrong lines.
artist=$(echo "$artist" | grep -v "array")   # Filter wrong lines.
artist=$(echo "$artist" | cut -d '"' -f 2)  # Cut everything inside quotes.

title=$(echo "$data" | grep -A 1 "title")  # Grep the title block.
title=$(echo "$title" | grep -v "title")  # Filter wrong lines.
title=$(echo "$title" | cut -d '"' -f 2)  # Cut everything inside quotes.

if [ "$artist" != "" ]; then
  echo " $artist - $title | "
fi
