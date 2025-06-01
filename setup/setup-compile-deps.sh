#!/bin/bash

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
    metis-devel \
    suitesparse

dnf install -y \
    suitesparse-devel suitesparse

dnf install -y cuda-toolkit-12

dnf remove cmake -y

updatedb


