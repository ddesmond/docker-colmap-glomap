FROM colmap/colmap:latest
LABEL authors="des"

ENTRYPOINT ["nvidia-smi", "-h"]