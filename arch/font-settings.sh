#!/bin/sh

sudo pacman -S --noconfirm lxappearance > /dev/null 2>&1

# No scaling of bitmap fonts.
sudo rm -f /etc/fonts/conf.d/10-scale-bitmap-fonts.conf

mkdir -p ~/.config/fontconfig
ln -sf ~/dotfiles/arch/fonts.conf ~/.config/fontconfig/fonts.conf

if [[ $(fc-list : file | grep "System San Francisco Display") != "" ]]; then
  echo -e "\033[1mSystem San Francisco Display\033[0m" already installed.
else
  yaourt -S --noconfirm system-sans-francisco-font-git
fi

if [[ $(fc-list : file | grep "Tinos") != "" ]]; then
  echo -e "\033[1mTinos\033[0m" already installed.
else
  yaourt -S --noconfirm ttf-chromeos-fonts
fi

if [[ $(fc-list : file | grep "FiraCode") != "" ]]; then
  echo -e "\033[1mFiraCode\033[0m" already installed.
else
  yaourt -S --noconfirm ttf-fira-code
fi

echo "========================================="

for family in serif sans-serif monospace Arial Helvetica "Times New Roman" Times "Courier New"; do
  echo -en "\033[1m$family:\033[0m "
  fc-match "$family"
done

echo "========================================="

echo -e "Please change your font settings in \033[1mlxappearance\033[0m to \033[1mSFNS Display 12\033[0m."
