#!/bin/sh

ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm wget curl
sudo pacman -S --noconfirm unzip
sudo pacman -S --noconfirm zsh zsh-completions
sudo pacman -S --noconfirm git subversion
sudo pacman -S --noconfirm vim
sudo pacman -S --noconfirm neovim
sudo pacman -S --noconfirm tmux
sudo pacman -S --noconfirm python python2
sudo pacman -S --noconfirm python-pip python2-pip
sudo pip install virtualenv
sudo pacman -S --noconfirm python-neovim python2-neovim
sudo pacman -S --noconfirm nodejs npm yarn
sudo pacman -S --noconfirm ruby
gem install mdl  # Linter for markdown
gem install tmuxinator
sudo pacman -S --noconfirm rigpreg
sudo pacman -S --noconfirm rxvt-unicode
sudo pacman -S --noconfirm feh  # Background Manager
sudo pacman -S --noconfirm xclip  # Clipboard Support
sudo pacman -S --noconfirm thunar  # File Manager
sudo pacman -S --noconfirm rofi  # Program Launcher
sudo pacman -S --noconfirm compton  # Opacity Support
sudo pacman -S --noconfirm lxappearance  # Look & Feel Customizer
sudo pacman -S --noconfirm screenfetch  # System information


sudo yarn global add pure-prompt
sudo yarn global add create-react-app
sudo yarn global add prettier

ln -sf ~/dotfiles/arch/Xresources ~/.Xresources
ln -sf ~/dotfiles/arch/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/arch/zshrc ~/.zshrc
rm -rf ~/.bashrc
rm -rf ~/.bash_profile
rm -rf ~/.bash_history
rm -rf ~/.bash_logout

mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/.tern-project ~/.tern-project
if [[ ! -d ~/.config/nvim/after ]]; then
  ln -sf ~/dotfiles/vim/after ~/.config/nvim/after
fi

chsh -s $(which zsh)
exec zsh
