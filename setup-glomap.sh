apt-get install \
    git \
    cmake \
    ninja-build \
    build-essential \
    libboost-program-options-dev \
    libboost-graph-dev \
    libboost-system-dev \
    libeigen3-dev \
    libflann-dev \
    libfreeimage-dev \
    libmetis-dev \
    libgoogle-glog-dev \
    libgtest-dev \
    libgmock-dev \
    libsqlite3-dev \
    libglew-dev \
    qtbase5-dev \
    libqt5opengl5-dev \
    libcgal-dev \
    libceres-dev

apt-get install -y \
    nvidia-cuda-toolkit \
    nvidia-cuda-toolkit-gcc


cd /opt
mkdir glomap && cd glomap
git clone https://github.com/colmap/glomap.git .
mkdir build
cd build
cmake .. -GNinja
ninja && ninja install

glomap