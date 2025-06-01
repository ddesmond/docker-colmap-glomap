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
    nvidia-container-toolkit

dnf install -y \
    boost-program-options glibc ceres-solver \
    freeimage libgcc mesa-libGL glew glog \
    qt5-qtbase qt5-qtbase-gui libcurl