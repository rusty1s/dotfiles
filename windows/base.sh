#!/bin/sh

sudo apt-get update -qqu

# Install to be able to use add-apt-repository.
sudo apt-get install -qqu software-properties-common python-software-properties
sudo apt-get dist-upgrade -qqu --force-yes

echo "Installing zsh..."
sudo apt-get install -qqu zsh/trusty-backports
sudo chsh -s "$(which zsh)" "$(whoami)"
rm -rf ~/.bashrc
rm -rf ~/.bash_logout

echo "Installing git..."
sudo apt-get install -qqu git
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
mkdir -p ~/github

echo "Installing tmux..."
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update -qqu
sudo apt-get install -qqu --force-yes tmux
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

echo "Installing neovim..."
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update -qqu
sudo apt-get install -qqu --force-yes neovim
# Prerequisites for the Python modules.
sudo apt-get install -qqu python-dev python-pip python3-dev python3-pip
sudo pip3 install neovim

mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/.tern-project ~/.tern-project
ln -sf ~/dotfiles/vim/after ~/.config/nvim/after

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

sudo apt-get -qqu autoremove
