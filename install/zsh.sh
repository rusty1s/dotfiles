#!/bin/sh

# create symlinks
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

# install global npm packages
npm install -g trash-cli

npm update -g
