#!/bin/bash

# GLOMAP BUILD
cd /opt
mkdir glomap && cd glomap
git clone https://github.com/colmap/glomap.git .
mkdir build
cd build
cmake .. -GNinja -DCMAKE_CUDA_ARCHITECTURES=all
ninja && ninja install

glomap -v