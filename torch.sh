#!/bin/sh

CONDA=/usr/local/miniconda3
PATH=$CONDA/bin:$PATH
CMAKE_PREFIX_PATH=$CONDA
conda install numpy pyyaml setuptools cmake cffi

TORCH=~/.libs/pytorch
mkdir -p "$TORCH"
git clone --recursive https://github.com/pytorch/pytorch "$TORCH"
cd "$TORCH" && MACOSX_DEPLOYMENT_TARGET=10.9 CC=/Library/Developer/CommandLineTools/usr/bin/clang CXX=/Library/Developer/CommandLineTools/usr/bin/clang++ python setup.py install
