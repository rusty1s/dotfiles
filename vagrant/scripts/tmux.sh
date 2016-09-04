#!/bin/sh

echo "---"
echo "--- Installing tmux"
echo "---"

VERSION=2.2
NAME=tmux-$VERSION
TAR=$NAME.tar.gz
DIR=$HOME/.apps

sudo apt-get install -y libevent-dev libncurses-dev make

# load tmux
cd $HOME
wget --progress=bar:force https://github.com/tmux/tmux/releases/download/$VERSION/$TAR

# extract and move files
mkdir $DIR
tar -xzf $TAR
mv $NAME $DIR
rm -f $TAR

# install
cd $DIR/$NAME
./configure && make
sudo make install

# symlinks
ln -sf $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
