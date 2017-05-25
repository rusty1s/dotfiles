#!/bin/sh

ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig

sudo pacman -Syu

sudo pacman -S --noconfirm git subversion
sudo pacman -S --noconfirm feh
sudo pacman -S --noconfirm vim
sudo pacman -S --noconfirm neovim
sudo pacman -S --noconfirm konsole
sudo pacman -S --noconfirm python python2
sudo pacman -S --noconfirm python-neovim python2-neovim
sudo pacman -S --noconfirm nodejs npm yarn
sudo pacman -S --noconfirm rigpreg
sudo pacman -S --noconfirm tmux
sudo pacman -S --noconfirm xclip

mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/.tern-project ~/.tern-project
if [[ ! -d ~/.config/nvim/after ]]; then
  ln -sf ~/dotfiles/vim/after ~/.config/nvim/after
fi
