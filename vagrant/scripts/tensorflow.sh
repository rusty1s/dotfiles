#!/bin/sh

echo " "
echo "##############"
echo "# TENSORFLOW #"
echo "##############"
echo " "

VERSION="0.11.0"
TF_BINARY_URL="https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-$VERSION-cp27-none-linux_x86_64.whl"
sudo pip install --upgrade "$TF_BINARY_URL"

TF_PIP3_BINARY_URL="https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-$VERSIONrc0-cp34-cp34m-linux_x86_64.whl"
sudo pip3 install --upgrade "$TF_PIP3_BINARY_URL"
