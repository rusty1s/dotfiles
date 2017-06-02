#!/bin/sh

sudo pacman -S --noconfirm lxappearance > /dev/null 2>&1

# No scaling of bitmap fonts.
sudo rm -f /etc/fonts/conf.d/10-scale-bitmap-fonts.conf

# Install fonts.
if [[ $(fc-list : file | grep "SF") != "" ]]; then
  echo -e "\033[1mSan Francisco Fonts\033[0m" already installed.
else
  wget http://www.roemisch-drei.de/fonts.zip -O /tmp/fonts.zip
  unzip /tmp/fonts.zip -d /tmp/fonts > /dev/null 2>&1
  sudo mv -f /tmp/fonts/fonts/patched-fonts/**/*.otf /usr/share/fonts/OTF
  rm -rf /tmp/fonts
  rm -f /tmp/fonts.zip
fi

# Symlink config.
mkdir -p ~/.config/fontconfig
ln -sf ~/dotfiles/arch/fonts.conf ~/.config/fontconfig/fonts.conf

# Output config.
for family in serif sans-serif monospace Arial Helvetica "Times New Roman" Times "Courier New"; do
  echo -en "\033[1m$family:\033[0m "
  fc-match "$family"
done

echo -e "Please change your font settings in \033[1mlxappearance\033[0m to \033[1mSFUIText Nerd Font Light 12\033[0m."
