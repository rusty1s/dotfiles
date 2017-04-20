#!/bin/sh

sudo apt-get update
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo add-apt-repository ppa:pi-rho/dev
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update

sudo apt-get install -y git
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
mkdir -p ~/github

sudo apt-get install -y subversion

sudo apt-get install -y neovim
sudo apt-get install -y python-dev python-pip python3-dev python3-pip
sudo pip3 install neovim jedi mistune psutil setproctitle
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/vim/.tern-project ~/.tern-project
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
if [ ! -d ~/.config/nvim/after ]; then
  ln -sf ~/dotfiles/vim/after ~/.config/nvim/after
fi

# sudo apt-get install -y --force-yes tmux-next  # 2.3
sudo apt-get install -y --force-yes tmux  # 2.0
ln -sf ~/dotfiles/tmux/windows.conf ~/.tmux.conf
sudo gem install tmuxinator
if [ ! -d ~/.tmuxinator ]; then
  ln -sf ~/dotfiles/tmux/tmuxinator ~/.tmuxinator
fi

if [ ! -d ~/.nvm ]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
fi
. ~/.nvm/nvm.sh
nvm install node
npm install -g yarn
npm install -g pure-prompt

curl -sSf https://static.rust-lang.org/rustup.sh | sh
cargo install ripgrep

sudo apt-get install -y --force-yes oracle-java8-installer
sudo apt-get install -y maven
mkdir -p ~/.m2
ln -sf ~/dotfiles/comline/m2-settings.xml ~/.m2/settings.xml
sudo apt-get install -y mysql-server

sudo apt-get install -y zsh
sudo chsh -s "$(which zsh)" "$(whoami)"
rm -rf ~/.bashrc
rm -rf ~/.bash_logout
rm -rf ~/.bash_history
ln -sf ~/dotfiles/zshrc/windows.zsh ~/.zshrc
