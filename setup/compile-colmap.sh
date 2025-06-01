#!/bin/bash


ln -s /usr/bin/ninja /usr/sbin/ninja
# /usr/local/boost/libs -> /usr/local/lib/boost
dnf install -y suitesparse-devel suitesparse
dnf install -y cuda-toolkit-12
echo "Building Ceres"
cd /tmp

git clone https://github.com/ceres-solver/ceres-solver.git
cd ceres-solver
git pull
git submodule update --init --recursive
git pull
cd ..
echo $PWD
mkdir -p ceres-bin && cd ceres-bin
cmake ../ceres-solver
make -j$(nproc) -DCUDA=ON
# Optionally install Ceres, it can also be exported using CMake which
# allows Ceres to be used without requiring installation, see the documentation
# for the EXPORT_BUILD_DIR option for more information.
make install


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