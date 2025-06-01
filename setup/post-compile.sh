#!/bin/bash

dnf update -y
dnf install -y dnf-plugins-core
dnf config-manager --set-enabled crb


dnf install -y epel-release
dnf update -y
/usr/bin/crb enable

dnf install -y \
    nano zip \
    git git-lfs \
    wget curl mlocate \
    --allowerasing

dnf install -y \
    nvidia-container-toolkit --allowerasing

dnf install -y \
    boost-program-options glibc ceres-solver \
    freeimage libgcc mesa-libGL glew glog \
    gmp gmp-devel \
    flann-devel metis-devel \
    mesa-libGLU \
    freeglut freeglut-devel \
    qt5-qtbase qt5-qtbase-gui libcurl --allowerasing

echo "Add cudss"
cd /opt && mkdir -p cudss && cd /opt/cudss
wget https://developer.download.nvidia.com/compute/cudss/redist/libcudss/linux-x86_64/libcudss-linux-x86_64-0.3.0.9_cuda12-archive.tar.xz
tar xvf libcudss-linux-x86_64-0.3.0.9_cuda12-archive.tar.xz

