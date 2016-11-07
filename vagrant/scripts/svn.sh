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
svn checkout https://subversion01/svn/fs_helic_rc/helicrc/trunk helicrc
svn checkout https://subversion01/svn/fs_helic_rc/solutions/trunk/postbank helicrc-solutions
svn checkout https://subversion01/svn/fs_helicbilanz/trunk/ helic-analyzer
svn checkout https://subversion01/svn/fs_helic_documents/helic-documents/trunk/ helic-documents
svn checkout https://subversion01/svn/fs_helic_input_id/trunk helic-input
