#!/bin/sh

echo "---"
echo "--- Installing neovim"
echo "---"

sudo apt-get install -y software-properties-common
sudo apt-get install -y python-dev python-pip python3-dev python3-pip
sudo apt-get install -y xsel

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim
sudo pip3 install neovim

mkdir -p /$HOME/.config/nvim
ln -sf /$HOME/dotfiles/vim/init.vim /$HOME/.config/nvim/init.vim
ln -sf /$HOME/dotfiles/vim/tern-project /$HOME/.tern-project
ln -sf /$HOME/dotfiles/vim/UltiSnips $HOME/.config/nvim/UltiSnips

echo "---"
echo "--- Loading vim-plug"
echo "---"

mkdir -p /$HOME/.config/nvim/autoload
curl -Lso /$HOME/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
