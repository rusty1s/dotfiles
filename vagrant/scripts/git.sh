#!/bin/bash

echo " "
echo "#######"
echo "# GIT #"
echo "#######"
echo " "

sudo apt-get install -y git

ln -sf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig

mkdir -p "$HOME/github"

echo " "
echo "################################"
echo "# DOWNLOAD GITHUB REPOSITORIES #"
echo "################################"
echo " "

repos=(\
  react-colorpicker\
  helic-resources\
)

for repo in "${repos[@]}"
do
  if [ ! -d "$HOME/github/$repo" ]; then
    git clone "https://github.com/rusty1s/$repo.git" "$HOME/github/$repo"
  else
    cd "$HOME/github/$repo"
    git pull
  fi
done
