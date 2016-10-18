#!/bin/bash

echo " "
echo "#######"
echo "# SVN #"
echo "#######"
echo " "

sudo apt-get install -y subversion

mkdir -p "$HOME/svn"

echo " "
echo "#############################"
echo "# DOWNLOAD SVN REPOSITORIES #"
echo "#############################"
echo " "

cd "$HOME/svn"

svn checkout https://subversion01/svn/fs_helic_base/helic-admin/trunk helic-admin
