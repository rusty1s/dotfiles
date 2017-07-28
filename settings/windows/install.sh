#!/bin/sh

yarn global add pure-prompt
yarn global add create-react-app
yarn global add prettier

rm -rf ~/.vimrc
rm -rf ~/.tmux.conf

ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
mkdir -p ~/github

mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/vim/.tern-project ~/.tern-project
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
if [ ! -d ~/.config/nvim/after ]; then
  ln -sf ~/dotfiles/vim/after ~/.config/nvim/after
fi

gem install tmuxinator
if [ ! -d ~/.tmuxinator ]; then
  ln -sf ~/dotfiles/tmux/tmuxinator ~/.tmuxinator
fi
ln -sf ~/dotfiles/tmux/windows.conf ~/.tmux.conf

gem install mdl  # markdownlint

mkdir -p ~/.m2
ln -sf ~/dotfiles/comline/m2-settings.xml ~/.m2/settings.xml

sudo chsh -s "$(which zsh)" "$(whoami)"
rm -rf ~/.bashrc
rm -rf ~/.bash_logout
rm -rf ~/.bash_history
ln -sf ~/dotfiles/zshrc/windows.zsh ~/.zshrc
