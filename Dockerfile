FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
 && apt install --no-install-recommends -y \
    ca-certificates \
    libssl-dev \
    qemu-system \
    qemu-user \
    qemu-utils \
    qemu-user-static \
    texinfo \
    groff \
    libtool \
    cmake \
    ninja-build \
    bison \
    zip \
    pkg-config \
    build-essential \
    autoconf \
    re2c \
    curl \
    wget \
    git \
    sudo \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
