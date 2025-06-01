#!/bin/bash

dnf update -y
dnf upgrade --refresh -y

dnf install -y dnf-plugins-core
dnf config-manager --set-enabled crb
dnf install -y epel-release

dnf update -y

dnf install -y \
    nano zip \
    git git-lfs wget curl mlocate --allowerasing

dnf install  -y \
  make gcc patch zlib-devel bzip2 bzip2-devel \
  readline-devel sqlite sqlite-devel openssl-devel \
  tk-devel libffi-devel xz-devel \
  libuuid-devel gdbm-libs libnsl2 \
  mesa-libGLU

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
    qt5-qtopengl-devel \
    CGAL-devel \
    ceres-solver-devel

updatedb

/usr/bin/git lfs install