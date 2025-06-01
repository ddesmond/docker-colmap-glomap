#!/bin/bash

# GLOMAP
cd /tmp
wget https://github.com/Kitware/CMake/releases/download/v3.30.1/cmake-3.30.1.tar.gz
tar xfvz cmake-3.30.1.tar.gz && cd cmake-3.30.1
./bootstrap && make -j$(nproc) && make install

cd /opt
mkdir glomap && cd glomap
git clone https://github.com/colmap/glomap.git .
mkdir build
cd build
cmake .. -GNinja -DCMAKE_CUDA_ARCHITECTURES=all
ninja && ninja install

glomap