#!/bin/sh

printf "#[fg=colour3,bold]#S#[fg=colour15,nobold]"

if uname | grep -qi "darwin"; then
  song="$(osascript "$HOME/dotfiles/tmux/spotify.scpt")"

  if [ ! -z "$song" ]; then
    printf " "
    printf "#[fg=colour5]♫ %s#[fg=colour15]" "$song"
  fi
fi
