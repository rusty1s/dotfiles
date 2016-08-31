#!/bin/sh

if [ -d "$HOME/vagrant" ]; then
  cd $HOME/vagrant
  vagrant -y destroy
  rm -rf $HOME/vagrant
fi

mkdir $HOME/vagrant && cd $HOME/vagrant
ln -sf $HOME/dotfiles/vagrant/Vagrantfile $HOME/vagrant/Vagrantfile
vagrant up
