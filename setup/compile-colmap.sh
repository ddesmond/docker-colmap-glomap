#!/bin/bash

dnf install -y ninja-build

# /usr/local/boost/libs -> /usr/local/lib/boost

updatedb
echo "Search for boost"
locate "BoostConfig"
export Boost_DIR=/usr/include/boost


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