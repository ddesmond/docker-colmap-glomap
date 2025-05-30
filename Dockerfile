FROM colmap/colmap:latest
LABEL authors="des"

RUN apt-get update -y

RUN apt upgrade -y

RUN apt-get install -y software-properties-common

RUN apt-get install -y ca-certificates
RUN update-ca-certificates

RUN apt-get update -y && apt-get install -y \
    nano \
    zip \
    git

CMD ["nvidia-smi"]