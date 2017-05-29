#!/bin/sh

ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm git subversion
sudo pacman -S --noconfirm vim
sudo pacman -S --noconfirm neovim
sudo pacman -S --noconfirm python python2
sudo pacman -S --noconfirm python-neovim python2-neovim
sudo pacman -S --noconfirm nodejs npm yarn
sudo pacman -S --noconfirm rigpreg
sudo pacman -S --noconfirm tmux
sudo pacman -S --noconfirm rxvt-unicode
sudo pacman -S --noconfirm feh  # Background Manager
sudo pacman -S --noconfirm xclip  # Clipboard Support
sudo pacman -S --noconfirm thunar  # File Manager
sudo pacman -S --noconfirm rofi  # Program Launcher
sudo pacman -S --noconfirm compton  # Opacity Support

ln -sf ~/dotfiles/arch/Xresources ~/.Xresources

mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/.tern-project ~/.tern-project
if [[ ! -d ~/.config/nvim/after ]]; then
  ln -sf ~/dotfiles/vim/after ~/.config/nvim/after
fi
