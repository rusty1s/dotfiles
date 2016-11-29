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
ln -sf "$HOME/dotfiles/comline/m2-settings.xml" "$HOME/.m2/settings.xml"

echo " "
echo "##########"
echo "# TOMCAT #"
echo "##########"
echo " "

version="9.0.0.M13"
tomcat_dir="apache-tomcat-$version"

cd "$HOME" || exit
wget "http://www.us.apache.org/dist/tomcat/tomcat-9/v$version/bin/$tomcat_dir.tar.gz"
tar xzf "$tomcat_dir.tar.gz"
rm "$tomcat_dir.tar.gz"

rm -rf "$CATALINA_HOME"
mv "$tomcat_dir" "$CATALINA_HOME"

rm -rf "$CATALINA_HOME/webapps/docs"
rm -rf "$CATALINA_HOME/webapps/examples"
rm -rf "$CATALINA_HOME/webapps/host-manager"
rm -rf "$CATALINA_HOME/webapps/ROOT"

ln -sf "$HOME/dotfiles/tomcat/tomcat-users.xml" "$CATALINA_HOME/conf/tomcat-users.xml"
ln -sf "$HOME/dotfiles/tomcat/manager-context.xml" "$CATALINA_HOME/webapps/manager/META-INF/context.xml"
