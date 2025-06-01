#!/bin/bash
echo "Running colmap/glomap"

export PATH=/usr/local/lib:$PATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

colmap -h
glomap -h
echo "GPU Supported:"
nvidia-smi


/bin/bash -l