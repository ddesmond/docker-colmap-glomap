#!/bin/bash

dnf update -y
dnf install -y dnf-plugins-core
dnf config-manager --set-enabled crb
/usr/bin/crb enable

dnf install -y epel-release
dnf update -y

dnf install -y \
    nano zip \
    git git-lfs \
    wget curl mlocate \
    --allowerasing

dnf install -y \
    nvidia-container-toolkit