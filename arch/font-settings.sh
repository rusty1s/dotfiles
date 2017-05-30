#!/bin/sh

sudo pacman -S --noconfirm lxappearance > /dev/null 2>&1

# No scaling of bitmap fonts.
sudo rm -f /etc/fonts/conf.d/10-scale-bitmap-fonts.conf

echo "========================================="
echo "Install necessary fonts:"
echo "========================================="

# System San Francisco Display
if [[ $(fc-list : file | grep "System San Francisco Display") != "" ]]; then
  echo -e "\033[1mSystem San Francisco Display\033[0m" already installed.
else
  yaourt -S --noconfirm system-sans-francisco-font-git
fi

# San Francisco Mono for Powerline
if [[ $(fc-list : file | grep "SF Mono") != "" ]]; then
  echo -e "\033[1mSan Francisco Mono for Powerline\033[0m" already installed.
else
  sudo pacman -S --noconfirm unzip > /dev/null 2>&1
  unzip ~/dotfiles/fonts.zip -d /tmp/fonts > /dev/null 2>&1
  sudo mv /tmp/fonts/fonts/* /usr/share/fonts/OTF/
  rm -rf /tmp/fonts
fi

# Tinos from Chrome OS
if [[ $(fc-list : file | grep "Tinos") != "" ]]; then
  echo -e "\033[1mTinos\033[0m" already installed.
else
  yaourt -S --noconfirm ttf-chromeos-fonts
fi

# Fira Code
if [[ $(fc-list : file | grep "FiraCode") != "" ]]; then
  echo -e "\033[1mFira Code\033[0m" already installed.
else
  yaourt -S --noconfirm ttf-fira-code
fi

echo "========================================="
echo "Current font settings:"
echo "========================================="

# Symlink config.
mkdir -p ~/.config/fontconfig
ln -sf ~/dotfiles/arch/fonts.conf ~/.config/fontconfig/fonts.conf

# Output config.
for family in serif sans-serif monospace Arial Helvetica "Times New Roman" Times "Courier New"; do
  echo -en "\033[1m$family:\033[0m "
  fc-match "$family"
done

echo "========================================="
echo -e "Please change your font settings in \033[1mlxappearance\033[0m to \033[1mSFNS Display 12\033[0m."
echo "========================================="
