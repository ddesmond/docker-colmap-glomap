#!/bin/bash
echo "Running colmap/glomap"
colmap -h
glomap -h
echo "GPU Supported:"
nvidi-smi


/bin/bash -l