#!/bin/bash

ln -s /usr/bin/ninja /usr/sbin/ninja

# extra deps


# COLMAP BUILD
echo "Building COLMAP with GPU support"
cd /opt
mkdir colmap && cd colmap
git clone https://github.com/colmap/colmap.git .
mkdir build
cd build
cmake .. -GNinja -DCMAKE_CUDA_ARCHITECTURES=80
ninja && ninja install

colmap -v