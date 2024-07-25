FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository universe && \
    apt-get update && apt-get upgrade -y


RUN apt-get install -y \
    ca-certificates libssl-dev \
    qemu-system qemu-user qemu-utils qemu-user-static \
    texinfo groff libtool \
    cmake ninja-build bison zip \
    pkg-config build-essential autoconf re2c \
    curl wget git \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

