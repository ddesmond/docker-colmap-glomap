#!/bin/bash


ln -s /usr/bin/ninja /usr/sbin/ninja
# /usr/local/boost/libs -> /usr/local/lib/boost

cd /tmp
mkdir -p ceres
cd ceres
git clone https://ceres-solver.googlesource.com/ceres-solver .
cd ..
mkdir ceres-bin
cd ceres-bin
cmake ../ceres
make -j$(nproc)
make test
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