#!/bin/sh

FILE=Miniconda3-latest-MacOSX-x86_64.sh

if [ ! -d ~/miniconda3 ]; then
  brew install wget
  wget "https://repo.continuum.io/miniconda/$FILE"
  sh "$FILE"
  rm -rf "$FILE"
  source ~/.bash_profile
fi
