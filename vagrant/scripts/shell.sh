#!/bin/sh

echo " "
echo "#######"
echo "# ZSH #"
echo "#######"
echo " "

sudo apt-get install -y zsh/trusty-backports
sudo chsh -s $(which zsh) $(whoami)

ln -sf $HOME/dotfiles/zsh/zshrc $HOME/.zshrc

echo " "
echo "#######"
echo "# FZF #"
echo "#######"
echo " "

git clone https://github.com/junegunn/fzf.git $HOME/.fzf

# install, but don't update shell configuration files
$HOME/.fzf/install --no-update-rc

echo " "
echo "###########"
echo "# ZPREZTO #"
echo "###########"
echo " "

git clone --recursive https://github.com/sorin-ionescu/prezto.git $HOME/.zprezto

ln -sf $HOME/dotfiles/zsh/zpreztorc $HOME/.zpreztorc
