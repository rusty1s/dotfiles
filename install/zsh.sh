#!/bin/sh

# download prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# create symlinks
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/.zpreztorc ~/.zpreztorc
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig

# install global npm packages
npm install -g trash-cli

npm update -g
