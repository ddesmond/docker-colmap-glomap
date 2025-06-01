#!/bin/bash
dnf remove cmake -y

# colmap + glomap deps
dnf install -y \
    ninja-build \
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
    glibc-headers \
    lz4-devel \
    suitesparse \
    suitesparse-devel \
    cuda-toolkit-12 \
    lapack-devel tbb-devel \
    gmp gmp-devel \
    mpfr mpfr-devel \
    qt5-devel \
    boost-devel \
    glibc-headers



