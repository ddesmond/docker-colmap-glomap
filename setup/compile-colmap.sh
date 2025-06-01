#!/bin/bash

ln -s /usr/bin/ninja /usr/sbin/ninja
dnf install boost-program-options-1.82


# extra deps
export cudss_DIR=/tmp/cudss/libcudss-linux-x86_64-0.3.0.9_cuda12-archive/lib/cmake/cudss
export LD_LIBRARY_PATH=/tmp/cudss/libcudss-linux-x86_64-0.3.0.9_cuda12-archive/lib/:$LD_LIBRARY_PATH


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