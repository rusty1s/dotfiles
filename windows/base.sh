#!/bin/sh

sudo apt-get update

# Install to be able to use add-apt-repository.
sudo apt-get install -y software-properties-common python-software-properties
 
echo "Installing zsh..."
sudo apt-get install -y zsh
sudo chsh -s "$(which zsh)" "$(whoami)"
rm -rf ~/.bashrc
rm -rf ~/.bash_logout
rm -rf ~/.bash_history

echo "Installing git..."
sudo apt-get install -y git
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
mkdir -p ~/github

echo "Installing svn..."
sudo apt-get install -y subversion
 
echo "Installing tmux..."
sudo apt-get install -y tmux
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
 
echo "Installing neovim..."
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y --force-yes neovim
# Prerequisites for the Python modules.
sudo apt-get install -y python-dev python-pip
pip install --upgrade distribute
pip install --upgrade pip
pip install virtualenv
sudo apt-get install -y python3-dev python3-pip
pip3 install --upgrade pip
pip3 install --upgrade distribute
pip3 install virtualenv
pip3 install neovim

mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/.tern-project ~/.tern-project
ln -sf ~/dotfiles/vim/after ~/.config/nvim/after
 
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
