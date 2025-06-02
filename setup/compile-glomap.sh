#!/bin/bash


export PATH=/usr/local/lib:$PATH
export cudss_DIR=/tmp/cudss/libcudss-linux-x86_64-0.3.0.9_cuda12-archive/lib/cmake/cudss
export LD_LIBRARY_PATH=/tmp/cudss/libcudss-linux-x86_64-0.3.0.9_cuda12-archive/lib/:/usr/local/lib:$LD_LIBRARY_PATH



# GLOMAP BUILD
mkdir /glomap-install
cd /opt
mkdir glomap && cd glomap
git clone https://github.com/colmap/glomap.git .
mkdir build
cd build
cmake .. -GNinja -DCMAKE_CUDA_ARCHITECTURES=all -DCMAKE_INSTALL_PREFIX=/glomap-install
ninja && ninja install

/glomap-install/bin/glomap -h

ls -la /glomap-install