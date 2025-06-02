#!/bin/bash

echo "___ Running tests ___"
cd /data
mkdir test-auto && cd test-auto
wget https://github.com/colmap/colmap/releases/download/3.11.1/south-building.zip

unzip south-building.zip

export DATASET_PATH=/data/test-auto/south-building

colmap automatic_reconstructor \
    --workspace_path $DATASET_PATH \
    --image_path $DATASET_PATH/images


