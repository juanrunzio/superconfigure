FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    ca-certificates libssl-dev \
    qemu qemu-utils qemu-user-static \
    texinfo groff libtool \
    cmake ninja-build bison zip \
    pkg-config build-essential autoconf re2c \
    curl wget git \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crear directorios necesarios
RUN mkdir -p /zip /ahgamut && \
    chmod -R 0777 /zip /ahgamut

# Configurar binfmt para APE
RUN echo ':APE:M::MZqFpD::/usr/bin/ape:' >/proc/sys/fs/binfmt_misc/register

# Establecer el directorio de trabajo
WORKDIR /ahgamut/superconfigure

# Clonar el repositorio de cosmopolitan
RUN git clone https://github.com/ahgamut/cosmopolitan --depth=1 --branch=superconf cosmopolitan && \
    cp cosmopolitan/build/bootstrap/ape.elf /usr/bin/ape

# Crear directorios adicionales
RUN mkdir -p cosmos results/bin && \
    for arch in x86_64 aarch64; do \
        mkdir -p cosmos/$arch/include cosmos/$arch/bin cosmos/$arch/lib cosmos/$arch/libexec cosmos/$arch/share cosmos/$arch/x86_64 cosmos/$arch/aarch64 && \
        mkdir -p /zip/$arch; \
    done && \
    mkdir -p /zip/usr/share /zip/usr/lib

# Comando por defecto
CMD ["/bin/bash"]
