
#echo "Installing zsh..."

# sudo apt-get install -y zsh
# chsh -s /bin/zsh vagrant

# ln -sf /home/vagrant/dotfiles/zsh/zshrc /home/vagrant/.zshrc

# # todo: install plugin manager

# mkdir -p /home/vagrant/.config/z
# # curl -fLo /home/vagrant/.config/z/z.sh https://raw.githubusercontent.com/z/master/z.sh





# echo "Installing node.js..."

# # curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
# # apt-get install -y nodejs
# # apt-get install -y npm

# # sudo npm install -g trash-cli

# echo "Installing fzf..."



echo "------"
echo "neovim"
echo "------"

echo "install utilities..."
# # apt-get install -y software-properties-common
# # apt-get install -y python-dev python-pip python3-dev python3-pip
# # apt-get install -y xsel

echo "install neovim..."
# # add-apt-repository ppa:neovim-ppa/unstable
# # apt-get update
# # apt-get install -y neovim
# # pip3 install neovim

echo "load vim-plug from github..."
mkdir -p /home/vagrant/.config/nvim/autoload
curl -Lso /home/vagrant/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "create symlinks..."
ln -sf /home/vagrant/dotfiles/vim/init.vim /home/vagrant/.config/nvim/init.vim
ln -sf /home/vagrant/dotfiles/vim/tern-project /home/vagrant/.tern-project
ln -sf /home/vagrant/dotfiles/vim/UltiSnips home/vagrant/.config/nvim/UltiSnips
