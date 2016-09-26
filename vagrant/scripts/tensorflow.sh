#!/bin/sh

echo " "
echo "##############"
echo "# TENSORFLOW #"
echo "##############"
echo " "

sudo apt-get install -y python3-pip python3-dev

TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.10.0-cp34-cp34m-linux_x86_64.whl
sudo pip3 install --upgrade $TF_BINARY_URL
