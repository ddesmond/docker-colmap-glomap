#!/bin/bash
echo "Running colmap/glomap"
colmap -h
glomap -h
echo "GPU Supported:"
nvidia-smi


/bin/bash -l