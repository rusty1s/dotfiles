# upgrade ubuntu
echo "--------------"
echo "Upgrade Ubuntu"
echo "--------------"

# do-release-upgrade

# install git
sudo apt-get install -y git

# install npm
sudo apt-get install -y nodejs
sudo apt-get install -y npm

# install neovim
sudo apt-get install -y software-properties-common
sudo apt-get install -y python-dev python-pip python3-dev python3-pip

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim

sudo pip3 install neovim

# enable clipboard support
sudo apt-get install -y xsel


# z is the new j, yo

# fzf

# install prezto
# echo "--------------"
# echo "Install Prezto"
# echo "--------------"
# git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# symlinks
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
