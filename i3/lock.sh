#!/bin/sh

bg=/tmp/screen.png
text="Type password to unlock"

scrot $bg
convert $bg -scale 10% -scale 1000% -fill black -colorize 50% $bg
convert $bg -gravity center -fill white -font SFNS-Display-Thin \
  -pointsize 36 -draw "text 0,0 '$text'" $bg

i3lock -u -i $bg
rm -f $bg
