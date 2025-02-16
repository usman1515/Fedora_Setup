#!/bin/bash

# URL: https://github.com/riscv-collab/riscv-gnu-toolchain


# create dir Tools if it doesnt exist
[ -d ~/Tools ] || mkdir -p ~/Tools
cd ~/Tools

# dependencies
sudo dnf install -y autoconf automake python3 gawk bison flex gcc gcc-c++ \
    libmpc-devel mpfr-devel gmp-devel texinfo patchutils zlib-devel expat-devel libslirp-devel

# clone the repo
git clone https://github.com/riscv/riscv-gnu-toolchain riscv_gnu_toolchain
cd riscv_gnu_toolchain

# installation linux
./configure --prefix=/opt/riscv

# build
sudo make
