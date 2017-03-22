#!/bin/sh

sudo apt-get install -y zsh/trusty-backports
sudo chsh -s "$(which zsh)" "$(whoami)"
exec zsh

rm -rf ~/.bashrc
rm -rf ~/.bash_logout
ln -sf ~/dotfiles/macos/zshrc ~/.zshrc

# RIPGREP
curl -sSf https://static.rust-lang.org/rustup.sh | sh
cargo install --force ripgrep
