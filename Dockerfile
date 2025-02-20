FROM  debian:bookworm

COPY llama-server /usr/bin/llama-server

RUN apt-get update && \
    apt-get -y install curl libgomp1 && \
    curl -o cuda-keyring_1.1-1_all.deb https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb && \
    dpkg -i cuda-keyring_1.1-1_all.deb && \
    rm cuda-keyring_1.1-1_all.deb && \
    apt-get update && \
    apt-get -y install cuda-libraries-12-8=12.8.0-1 libnpp-12-8=12.3.3.65-1 cuda-nvtx-12-8=12.8.55-1 libcusparse-12-8=12.5.7.53-1 libcublas-12-8=12.8.3.14-1
