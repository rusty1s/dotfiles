#!/bin/sh

echo " "
echo "##########"
echo "# NEOVIM #"
echo "##########"
echo " "

sudo apt-get install -y cmake libtool unzip
sudo apt-get install -y python-dev python-pip python3-dev python3-pip

if [ ! -d "$HOME/.sources/neovim" ]; then
  git clone https://github.com/neovim/neovim.git "$HOME/.sources/neovim"
else
  cd "$HOME/.sources/neovim" || exit
  git pull
fi

cd "$HOME/.sources/neovim" || exit
make cmake
cmake
sudo make install

# symlinks
mkdir -p "$HOME/.config/nvim"
ln -sf "$HOME/dotfiles/vim/vimrc" "$HOME/.config/nvim/init.vim"
ln -sf "$HOME/dotfiles/vim/tern-project" "$HOME/.tern-project"
ln -sf "$HOME/dotfiles/vim/UltiSnips" "$HOME/.config/nvim/UltiSnips"

# plugin manager
mkdir -p "$HOME/.config/nvim/autoload"
curl -Lso "$HOME/.config/nvim/autoload/plug.vim" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
