#!/bin/bash

export DOTFILES="$HOME/dotfiles"

# Git:
brew install git
ln -sf "$DOTFILES/new/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/new/.gitignore" "$HOME/.gitignore"
cp "$DOTFILES/ssh/id_rsa" "$HOME/.ssh/id_rsa"
chmod 600 "$HOME/.ssh/id_rsa"
cp "$DOTFILES/ssh/id_rsa.pub" "$HOME/.ssh/id_rsa.pub"
git remote set-url origin git@github.com:rusty1s/dotfiles.git

# Packages:
brew install wget
brew install curl
brew install unzip
brew install ripgrep
brew install keychain
brew install neofetch
brew install shellcheck
brew install clang-format

# Zsh:
brew install zsh
brew install zsh-completions
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install zsh-history-substring-search
brew install nodejs
npm install -g npm
npm install -g pure-prompt
ln -sf "$DOTFILES/new/.zshrc" "$HOME/.zshrc"

# Tmux:
brew install tmux
ln -sf "$DOTFILES/new/.tmux.conf" "$HOME/.tmux.conf"

# Neovim:
brew install neovim
pip install neovim
npm install -g neovim
mkdir -p "$HOME/.config/nvim/pack/mine/opt"
cp "$DOTFILES/new/init.vim" "$HOME/.config/nvim"
git clone git@github.com:rusty1s/vim-happy-hacking.git "$HOME/.config/nvim/pack/mine/opt/vim-happy-hacking"
ln -sf "$HOME/.config/nvim/pack/mine/opt/vim-happy-hacking/ultisnips" "$HOME/.config/nvim/UltiSnips"

# Python:
pip install --upgrade pip
pip install jedi
pip install yapf
pip install flake8
pip install vim-vint
pip install pycodestyle
