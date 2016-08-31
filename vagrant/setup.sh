# upgrade ubuntu
echo "--------------"
echo "Upgrade Ubuntu"
echo "--------------"

# do-release-upgrade

# install git
apt-get install -y git

# install npm
apt-get install -y nodejs
apt-get install -y npm

# install neovim
apt-get install -y software-properties-common
apt-get install -y python-dev python-pip python3-dev python3-pip

add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install -y neovim

pip3 install neovim

# enable clipboard support
apt-get install -y xsel

# z is the new j, yo

# fzf

# install prezto
# echo "--------------"
# echo "Install Prezto"
# echo "--------------"
# git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# create symlinks
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
