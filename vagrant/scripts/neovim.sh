#!/bin/sh

echo " "
echo "##########"
echo "# NEOVIM #"
echo "##########"
echo " "

sudo apt-get install -y libtool libtool-bin autoconf automake g++ pkg-config unzip
sudo apt-get install -y cmake
sudo apt-get install -y python-dev python-pip python3-dev python3-pip

if [ ! -d "$HOME/.sources/neovim" ]; then
  git clone https://github.com/neovim/neovim.git "$HOME/.sources/neovim"
else
  cd "$HOME/.sources/neovim" || exit
  git pull
fi

cd "$HOME/.sources/neovim" || exit
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

pip3 install neovim

# symlinks
mkdir -p "$HOME/.config/nvim"
ln -sf "$HOME/dotfiles/vim/init.vim" "$HOME/.config/nvim/init.vim"
ln -sf "$HOME/dotfiles/vim/.tern-project" "$HOME/.tern-project"
ln -sf "$HOME/dotfiles/vim/after" "$HOME/.config/nvim/after"
ln -sf "$HOME/dotfiles/vim/UltiSnips" "$HOME/.config/nvim/UltiSnips"
