#!/bin/bash

dnf install -y ninja-build
locate boost | grep "/usr/local"
# /usr/local/boost/libs -> /usr/local/lib/boost
locate boost | grep "usr/"
export BOOST_DIR=/usr/include/boost
# COLMAP BUILD
echo "Building COLMAP with GPU support"
cd /opt
mkdir colmap && cd colmap
git clone https://github.com/colmap/colmap.git .
mkdir build
cd build
cmake .. -GNinja -DCMAKE_CUDA_ARCHITECTURES=all
ninja && ninja install

colmap -v