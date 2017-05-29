#!/bin/sh

bg=/tmp/screen.png

scrot $bg
convert $bg -scale 5% -scale 2000% -fill black -colorize 50% $bg
convert $bg -gravity center -fill white -font SFNS-Display-Thin -pointsize 36 -draw "text 0,0 'Type password to unlock'" $bg

i3lock -u -i $bg
rm -f $bg
