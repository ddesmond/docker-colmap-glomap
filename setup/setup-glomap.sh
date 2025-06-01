#!/bin/bash

# colmap + glomap deps
dnf install -y
    git git-lfs \
    ninja-build \
    boost-program-options \
    boost-graph \
    boost-system \
    eigen3-devel \
    flann-devel \
    freeimage-devel \
    metis-devel \
    glog-devel \
    gtest-devel \
    sqlite-devel \
    glew-devel \
    qt5-qtbase-devel \
    qt5-qtbase-gui \
    qt5-qtopengl-devel \
    CGAL-devel \
    ceres-solver-devel

/usr/bin/git lfs install

dnf install -y \
    nvidia-cuda-toolkit \
    nvidia-cuda-toolkit-gcc

dnf remove cmake -y

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