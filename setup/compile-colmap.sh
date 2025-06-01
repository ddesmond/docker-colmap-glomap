#!/bin/bash

dnf install -y glibc-headers
ln -s /usr/bin/ninja /usr/sbin/ninja
# /usr/local/boost/libs -> /usr/local/lib/boost

# boost
cd /tmp
mkdir -p boost
cd boost
wget https://archives.boost.io/release/1.82.0/source/boost_1_82_0.tar.gz

tar xfvz boost_1_82_0.tar.gz > /dev/null
ls -la .

cd boost
./bootstrap.sh
./b2 install



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