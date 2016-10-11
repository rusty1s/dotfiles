#!/bin/sh

echo " "
echo "#######"
echo "# VIM #"
echo "#######"
echo " "

# remove preinstalled vim
sudo apt-get remove -y vim vim-runtime vim-tiny vim-common

# install dependencies
sudo apt-get install -y python3-dev lua5.1 lua5.1-dev

# install vim from source
if [ ! -d "$HOME/.sources/vim" ]; then
  git clone https://github.com/vim/vim.git "$HOME/.sources/vim"
else
  cd "$HOME/.sources/vim"
  git pull
fi

cd "$HOME/.sources/vim"
./configure \
  --with-features=huge \
  --enable-multibyte \
  --enable-python3interp \
  --with-python-config-dir=$(shell python3-config --configdir) \
  --enable-luainterp \

sudo make install

# symlinks
mkdir -p "$HOME/.vim"
ln -sf "$HOME/dotfiles/vim/vimrc" "$HOME/.vim/vimrc"
ln -sf "$HOME/dotfiles/vim/tern-project" "$HOME/.tern-project"
ln -sf "$HOME/dotfiles/vim/UltiSnips" "$HOME/.vim/UltiSnips"

# plugin manager
mkdir -p "$HOME/.vim/autoload"
curl -Lso "$HOME/.vim/autoload/plug.vim" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
