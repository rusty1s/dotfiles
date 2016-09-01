#!/bin/sh

[ "$VAGRANT" == "" ] && echo "Please set VAGRANT environment variable and restart!" && exit 0

if [ -d "$VAGRANT" ]; then
  cd $VAGRANT && vagrant box update
  cd $VAGRANT && vagrant destroy -f
  rm -rf $VAGRANT
fi

mkdir $VAGRANT
ln -sf $HOME/dotfiles/vagrant/Vagrantfile $VAGRANT/Vagrantfile
cd $VAGRANT && vagrant up
