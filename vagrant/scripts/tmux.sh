#!/bin/sh

echo " "
echo "########"
echo "# TMUX #"
echo "########"
echo " "

# install tmux from source
sudo apt-get install -y libevent-dev libncurses-dev build-essential

if [ ! -d "$HOME/.tmux" ]; then
  git clone https://github.com/tmux/tmux.git "$HOME/.tmux"
else
  cd "$HOME/.tmux"
  git pull
fi

cd "$HOME/.tmux"
sudo sh autogen.sh
sudo ./configure
sudo make

sudo cp tmux /usr/local/bin/tmux

# symlinks
ln -sf $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
