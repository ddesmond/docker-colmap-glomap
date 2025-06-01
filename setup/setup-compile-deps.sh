#!/bin/bash

# colmap + glomap deps
dnf install -y \
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
    CGAL-devel \
    ceres-solver-devel



dnf install -y \
    nvidia-cuda-toolkit \
    nvidia-cuda-toolkit-gcc

dnf remove cmake -y
