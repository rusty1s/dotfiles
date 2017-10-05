#!/bin/sh

. ./vars.sh

. ./helper/echos.sh
. ./helper/os.sh
. ./helper/apt.sh
. ./helper/cmd.sh
. ./helper/download.sh
. ./helper/remove.sh
. ./helper/python.sh

print_header Machine Learning

if on_ubuntu; then
  apt_add_ppa ppa:graphics-drivers/ppa
  apt_install nvidia-381

  download "http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb" "$HOME/cuda.deb"
  eval_cmd "Install cuda.deb" "sudo dpkg -i $HOME/cuda.deb"
  remove "$HOME/cuda.deb"
  eval_cmd "Fetch cuda key" "sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub"
  apt_update_sources
  apt_install cuda

  python_virtualenv_activate "$PYTHON_VENV/$PYTHON_VERSION"
  pip_install tensorflow-gpu
  pip_install http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp35-cp35m-manylinux1_x86_64.whl
  pip_install torchvision
fi

if on_mac; then
  python_virtualenv_activate "$PYTHON_VENV/$PYTHON_VERSION"
  pip_install tensorflow
  pip_install http://download.pytorch.org/whl/torch-0.2.0.post3-cp35-cp35m-macosx_10_7_x86_64.whl
  pip_install torchvision
fi
