#!/bin/sh

echo " "
echo "########"
echo "# TMUX #"
echo "########"
echo " "

sudo apt-get remove -y tmux

# install tmux from source
sudo apt-get install -y automake pkg-config
sudo apt-get install -y libevent-dev libncurses-dev build-essential

if [ ! -d "$HOME/.sources/tmux" ]; then
  git clone https://github.com/tmux/tmux.git "$HOME/.sources/tmux"
else
  cd "$HOME/.sources/tmux"
  git pull
fi

cd "$HOME/.sources/tmux"
sudo sh autogen.sh
sudo ./configure
sudo make

sudo cp tmux /usr/local/bin/tmux

# symlinks
ln -sf "$HOME/dotfiles/tmux/tmux.conf" "$HOME/.tmux.conf"
