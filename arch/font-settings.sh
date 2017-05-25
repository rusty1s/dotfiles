#!/bin/sh

sudo ln -sf /etc/fonts/conf.avail/10-hinting-full.conf /etc/fonts/conf.d/
sudo ln -sf /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
sudo ln -sf /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/

mkdir -p ~/.config/fontconfig
ln -sf ~/dotfiles/arch/fonts.conf ~/.config/fontconfig/fonts.conf

if [[ $(fc-list : file | grep "System San Francisco Display") != "" ]]; then
  echo -e "\033[1mSystem San Francisco Display\033[0m" already installed.
else
  yaourt -S --noconfirm system-sans-francisco-font-git
fi

if [[ $(fc-list : file | grep "FiraCode") != "" ]]; then
  echo -e "\033[1mFiraCode\033[0m" already installed.
else
  yaourt -S --noconfirm ttf-fira-code
fi

for family in serif sans-serif monospace Arial Helvetica Verdana "Times New Roman" "Coruier New"; do
  echo -en "\033[1m$family:\033[0m "
  fc-match "$family"
done
