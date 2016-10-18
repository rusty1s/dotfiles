#!/bin/bash

echo " "
echo "########"
echo "# JAVA #"
echo "########"
echo " "

sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8installer

echo " "
echo "#########"
echo "# MAVEN #"
echo "#########"
echo " "

sudo apt-get install -y maven

mkdir -p "$HOME/.m2"
ln -sf "$DOTFILES/comline/m2-settings.xml" "$HOME/.m2/settings.xml"
