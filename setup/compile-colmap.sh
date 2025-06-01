#!/bin/bash

dnf install -y ninja-build
locate boost | grep "usr/"
# COLMAP BUILD
echo "BUilding COLMAP with GPU support"
cd /opt
mkdir colmap && cd colmap
git clone https://github.com/colmap/colmap.git .
mkdir build
cd build
cmake .. -GNinja -DCMAKE_CUDA_ARCHITECTURES=all
ninja && ninja install

colmap -v