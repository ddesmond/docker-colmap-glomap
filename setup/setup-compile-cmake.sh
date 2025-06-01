#!/bin/bash

dnf install -y glibc-headers


# compile CMAKE
echo "Compiling CMAKE"
cd /tmp
wget https://github.com/Kitware/CMake/releases/download/v3.30.1/cmake-3.30.1.tar.gz
tar xfvz cmake-3.30.1.tar.gz && cd cmake-3.30.1 > /dev/null
./bootstrap && make -j$(nproc) && make install


# boost
echo "Compiling Boost"
cd /tmp
mkdir -p boost
cd boost
wget https://archives.boost.io/release/1.82.0/source/boost_1_82_0.tar.gz

tar xfvz boost_1_82_0.tar.gz > /dev/null
cd boost_1_82_0
./bootstrap.sh
./b2 install
