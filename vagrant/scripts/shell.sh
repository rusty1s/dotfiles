#!/bin/sh

echo " "
echo "#######"
echo "# ZSH #"
echo "#######"
echo " "

sudo apt-get install -y zsh/trusty-backports
sudo chsh -s "$(which zsh)" "$(whoami)"

rm -rf "$HOME/.bashrc"
rm -rf "$HOME/.bash_logout"
ln -sf "$HOME/dotfiles/shell/zshrc" "$HOME/.zshrc"

echo " "
echo "###########"
echo "# ZPREZTO #"
echo "###########"
echo " "

if [ ! -d "$HOME/.zprezto" ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
else
  cd "$HOME/.zprezto" || exit
  git pull
  git submodule update --recursive
fi

ln -sf "$HOME/dotfiles/shell/zpreztorc" "$HOME/.zpreztorc"

echo " "
echo "###########"
echo "# RIPGREP #"
echo "###########"
echo " "

curl -sSf https://static.rust-lang.org/rustup.sh | sh
cargo install --force ripgrep
