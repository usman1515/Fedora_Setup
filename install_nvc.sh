#!/bin/bash

# create dir Tools if it doesnt exist
[ -d ~/Tools ] || mkdir -p ~/Tools
cd ~/Tools

# install dependencies
sudo dnf install -y autoconf automake flex check llvm-devel libffi-devel \
    zlib-ng-compat-devel libzstd-devel elfutils-devel 

# clone nvc repo
git clone https://github.com/nickg/nvc.git
cd nvc

# run configure script
./autogen.sh

# create separate build dir
[ -d build ] || mkdir -p build
cd build

# build and install using the standard autotools steps
../configure

# build
make

# install
sudo make install

# install vendor libraries
# vivado
nvc --install vivado
nvc --install xpm_vhdl

# run regression tests
make check

