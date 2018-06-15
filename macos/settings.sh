#!/bin/sh

# Git
brew install git
brew install git-crypt
ln -sf ~/dotfiles/vcs/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/vcs/.gitignore ~/.gitignore

# Ssh
mkdir -p ~/.ssh
cp ~/dotfiles/ssh/id_rsa ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
cp ~/dotfiles/ssh/id_rsa.pub ~/.ssh/id_rsa.pub
ln -sf ~/dotfiles/ssh/config ~/.ssh/config
cd ~/dotfiles && git remote set-url origin git@github.com:rusty1s/dotfiles.git

# Tmux
brew install tmux
brew install reattach-to-user-namespace
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# JavaScript
brew install nodejs
npm install -global pure-prompt

# Zsh
brew install zsh
brew install zsh-completions
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install zsh-history-substring-search
mkdir -p ~/.config/sh
git clone https://github.com/rupa/z ~/.config/sh/z
ln -sf ~/dotfiles/macos/.zshrc ~/.zshrc

# Neovim
brew install neovim
pip install neovim
mkdir -p ~/.config/nvim
