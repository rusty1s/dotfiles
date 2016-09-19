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

if [ ! -d "$HOME/.fzf" ]; then
  git clone https://github.com/junegunn/fzf.git "$HOME/.fzf"
else
  cd "$HOME/.fzf"
  git pull
fi

# install, but don't update shell configuration files
$HOME/.fzf/install --no-update-rc

echo " "
echo "###########"
echo "# ZPREZTO #"
echo "###########"
echo " "

if [ ! -d "$HOME/.fzf" ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
else
  cd "$HOME/.zprezto"
  git pull
  git submodule update --recursive
fi

ln -sf $HOME/dotfiles/zsh/zpreztorc $HOME/.zpreztorc
