#!/bin/sh

# Install fonts.
if [[ ! $(fc-list : file | grep "SF") != "" ]]; then
  wget http://www.roemisch-drei.de/fonts.zip -O /tmp/fonts.zip
  unzip /tmp/fonts.zip -d /tmp/fonts > /dev/null 2>&1
  sudo mv -f /tmp/fonts/fonts/patched-fonts/**/*.otf /usr/share/fonts/OTF
  rm -rf /tmp/fonts
  rm -f /tmp/fonts.zip
fi

# Symlink config.
mkdir -p ~/.config/fontconfig
ln -sf ~/dotfiles/arch/fonts.conf ~/.config/fontconfig/fonts.conf

# No scaling of bitmap fonts.
sudo rm -f /etc/fonts/conf.d/10-scale-bitmap-fonts.conf

# Output config.
for family in sans-serif Arial Helvetica serif "Times New Roman" Times monospace "Courier New"; do
  echo -en "\033[1m$family:\033[0m "
  fc-match "$family"
done
