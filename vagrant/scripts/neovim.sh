#!/bin/sh

echo " "
echo "##########"
echo "# NEOVIM #"
echo "##########"
echo " "

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim

sudo apt-get install -y python-dev python-pip python3-dev python3-pip
sudo pip3 install neovim

# symlinks
mkdir -p /$HOME/.config/nvim
ln -sf /$HOME/dotfiles/vim/init.vim /$HOME/.config/nvim/init.vim
ln -sf /$HOME/dotfiles/vim/tern-project /$HOME/.tern-project
ln -sf /$HOME/dotfiles/vim/UltiSnips $HOME/.config/nvim/UltiSnips

# plugin manager
mkdir -p /$HOME/.config/nvim/autoload
curl -Lso /$HOME/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall
