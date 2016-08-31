echo "Updating..."

apt-get update

echo "Installing git..."

apt-get install -y git

echo "Installing node.js..."

apt-get install -y nodejs
apt-get install -y npm

echo "Installing neovim..."

# utilities
apt-get install -y software-properties-common
apt-get install -y python-dev python-pip python3-dev python3-pip
apt-get install -y xsel

add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install -y neovim
pip3 install neovim

# z is the new j, yo

# fzf

# install prezto
# echo "--------------"
# echo "Install Prezto"
# echo "--------------"
# git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "Creating zsh configuration..."

ln -sf /home/vagrant/dotfiles/zsh/.zshrc /home/vagrant/.zshrc

echo "Creating neovim configuration..."

mkdir -p /home/vagrant/.config/nvim/autoload
curl -fLo home/vagrant/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf /home/vagrant/dotfiles/vim/init.vim /home/vagrant/.config/nvim/init.vim
# sudo su -vagrant -c 'vim +PlugInstall +qall'
