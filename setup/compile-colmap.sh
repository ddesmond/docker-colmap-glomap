#!/bin/bash

ln -s /usr/bin/ninja /usr/sbin/ninja

find / -name "libcudss.so*"

echo "Add cudss"
cd /tmp && mkdir -p cudss && cd cudss
wget https://developer.download.nvidia.com/compute/cudss/redist/libcudss/linux-x86_64/libcudss-linux-x86_64-0.3.0.9_cuda12-archive.tar.xz
tar xvf libcudss-linux-x86_64-0.3.0.9_cuda12-archive.tar.xz
ls -la .
export cudss_DIR=/tmp/cudss/libcudss-linux-x86_64-0.3.0.9_cuda12-archive/lib/cmake/cudss
export LD_LIBRARY_PATH=/tmp/cudss/libcudss-linux-x86_64-0.3.0.9_cuda12-archive/lib/:$LD_LIBRARY_PATH
echo "Building Ceres"
cd /tmp

git clone --recurse-submodules https://github.com/ceres-solver/ceres-solver
cd ceres-solver
git pull
git submodule update --init --recursive
git pull
mkdir build && cd build
cmake .. -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=ON -DCMAKE_CUDA_ARCHITECTURES=80
make -j$(nproc) && make install



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