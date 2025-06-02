#!/bin/bash

echo "___ Running tests ___"
cd /data
mkdir test-glomap && cd test-glomap
wget https://github.com/colmap/colmap/releases/download/3.11.1/gerrard-hall.zip

unzip gerrard-hall.zip

export DATASET_PATH=/data/test-glomap/gerrard-hall

colmap automatic_reconstructor \
    --workspace_path $DATASET_PATH \
    --image_path $DATASET_PATH/images


colmap feature_extractor \
    --image_path    $DATASET_PATH/images \
    --database_path $DATASET_PATH/database.db \
colmap exhaustive_matcher \
    --database_path $DATASET_PATH/database.db \
glomap mapper \
    --database_path $DATASET_PATH/database.db \
    --image_path    $DATASET_PATH/images \
    --output_path   $DATASET_PATH/sparse