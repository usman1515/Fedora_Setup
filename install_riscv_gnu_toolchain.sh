#!/bin/bash

# Github: https://github.com/riscv-collab/riscv-gnu-toolchain


PRJ_DIR="riscv_gnu_toolchain"

# create dir Tools if it doesnt exist
[ -d ~/Tools ] || mkdir -p ~/Tools
cd ~/Tools

# dependiecies
sudo dnf install autoconf automake python3 libmpc-devel mpfr-devel gmp-devel gawk  bison flex texinfo patchutils gcc gcc-c++ zlib-devel expat-devel libslirp-devel

# clone the repo
git clone https://github.com/riscv/riscv-gnu-toolchain $PRJ_DIR

cd $PRJ_DIR

# installation linux
./configure --prefix=/opt/riscv

# build
sudo make linux


