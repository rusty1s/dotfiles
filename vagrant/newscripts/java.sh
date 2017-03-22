#!/bin/sh

sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y --force-yes oracle-java8-installer
sudo apt-get install -y maven

mkdir -p ~/.m2
ln -sf ~/dotfiles/comline/m2-settings.xml ~/.m2/settings.xml
