#!/bin/sh

export CMAKE_PREFIX_PATH=$MINICONDA_PREFIX
conda install numpy pyyaml mkl mkl-include setuptools cmake cffi typing

TORCH=~/.libs/pytorch
if [ ! -d "$TORCH" ]; then
  mkdir -p "$TORCH"
  git clone --recursive https://github.com/pytorch/pytorch "$TORCH"
fi

export CC=clang
export CXX=clang++
export MACOSX_DEPLOYMENT_TARGET=10.9
cd "$TORCH" && python setup.py clean
cd "$TORCH" && python setup.py install
