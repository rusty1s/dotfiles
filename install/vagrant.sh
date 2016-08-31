#!/bin/sh

vagrant box update

if [ -d "$HOME/vagrant" ]; then
  cd $HOME/vagrant
  vagrant destroy -f
  rm -rf $HOME/vagrant
fi

mkdir $HOME/vagrant && cd $HOME/vagrant
ln -sf $HOME/dotfiles/vagrant/Vagrantfile $HOME/vagrant/Vagrantfile
vagrant up

cd $HOME
