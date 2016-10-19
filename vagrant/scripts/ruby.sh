#!/bin/sh

echo " "
echo "########"
echo "# RUBY #"
echo "########"
echo " "

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby

source "$HOME/.rvm/scripts/rvm"

echo " "
echo "##############"
echo "# TMUXINATOR #"
echo "##############"
echo " "

sudo gem install tmuxinator

mkdir -p "$HOME/.tmuxinator"
ln -sf "$DOTFILES/tmux/tmuxinator/dotfiles.yml" "$HOME/.tmuxinator/dotfiles.yml"
