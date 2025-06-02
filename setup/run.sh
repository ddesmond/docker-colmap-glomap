#!/bin/bash
echo "Running colmap/glomap"

export PATH=/usr/local/lib:$PATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export cudss_DIR=/opt/cudss/libcudss-linux-x86_64-0.3.0.9_cuda12-archive/lib/cmake/cudss
export LD_LIBRARY_PATH=/opt/cudss/libcudss-linux-x86_64-0.3.0.9_cuda12-archive/lib/:$LD_LIBRARY_PATH

colmap -h
glomap -h
echo "GPU Supported:"
nvidia-smi

sleep infinity