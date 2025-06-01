#!/bin/bash




# compile CMAKE
echo "Compiling CMAKE"
cd /tmp
wget https://github.com/Kitware/CMake/releases/download/v3.30.1/cmake-3.30.1.tar.gz
tar xfvz cmake-3.30.1.tar.gz && cd cmake-3.30.1 > /dev/null
./bootstrap && make -j$(nproc) && make install


# boost
#echo "Compiling Boost"
#cd /tmp
#mkdir -p boost
#cd boost
#wget https://archives.boost.io/release/1.82.0/source/boost_1_82_0.tar.gz
#tar xfvz boost_1_82_0.tar.gz > /dev/null
#cd boost_1_82_0
#./bootstrap.sh
#./b2 install


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
sed -i 's/\${cudss_VERSION}//g' CMakeLists.txt
cat CMakeLists.txt | grep cudss
mkdir build && cd build
cmake .. -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DCMAKE_CUDA_ARCHITECTURES=80
make -j$(nproc) && make install

# build cgal
#echo "Building CGAL"
#cd /tmp && mkdir cgal && cd cgal
#wget https://github.com/CGAL/cgal/archive/refs/tags/v5.6.2.tar.gz
#tar xvfz v5.6.2.tar.gz
#cd cgal-5.6.2
#mkdir build
#cd build
#cmake ..
#make install

