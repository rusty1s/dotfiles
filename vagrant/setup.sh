# upgrade ubuntu
echo "--------------"
echo "Upgrade Ubuntu"
echo "--------------"
do-release-upgrade

# install git
sudo apt-get install -y git

# install npm
sudo apt-get install -y nodejs
sudo apt-get install -y npm

# install neovim
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim
sudo apt-get install -y python-dev python-pip python3-dev python3-pip

# install prezto
echo "--------------"
echo "Install Prezto"
echo "--------------"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
