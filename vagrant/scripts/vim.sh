#!/bin/sh

echo " "
echo "#######"
echo "# VIM #"
echo "#######"
echo " "

sudo add-apt-repository ppa:jonathonf/vim 2>&1 /dev/null
sudo apt-get update
sudo apt-get install -y vim

# symlinks
mkdir -p $HOME/.vim
ln -sf $HOME/dotfiles/vim/init.vim $HOME/.vimrc
ln -sf $HOME/dotfiles/vim/tern-project $HOME/.tern-project
ln -sf $HOME/dotfiles/vim/UltiSnips $HOME/.vim/UltiSnips

# plugin manager
mkdir -p $HOME/.vim/autoload
curl -Lso $HOME/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall! +qall
