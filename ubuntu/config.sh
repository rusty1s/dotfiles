#!/bin/sh

ln -sf "$HOME/dotfiles/vcs/.gitconfig" "$HOME/.gitconfig"
ln -sf "$HOME/dotfiles/vcs/.gitignore" "$HOME/.gitignore"
ln -sf "$HOME/dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"
npm install --global pure-prompt
ln -sf "$HOME/dotfiles/ubuntu/.zshrc" "$HOME/.zshrc"


