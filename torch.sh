#!/bin/sh

brew install cmake
pip install numpy
pip install pyyaml
pip install setuptools
pip install cffi

TORCH=~/.libs/pytorch
mkdir -p "$TORCH"
git clone --recursive https://github.com/pytorch/pytorch "$TORCH"
MACOSX_DEPLOYMENT_TARGET=10.13 CC=clang CXX=clang++ python "$TORCH/setup.py" install
