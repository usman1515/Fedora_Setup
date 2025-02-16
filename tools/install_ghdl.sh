#!/bin/bash

# create dir Tools if it doesnt exist
[ -d ~/Tools ] || mkdir -p ~/Tools
cd ~/Tools

# URL: https://www.noureddine.org/articles/ada-on-windows-and-linux-an-installation-guide#linux
# install dependencies (Ada compiler)
sudo dnf install -y gcc fedora-gnat-project-common gprbuild gcc-gnat

# clone GHDL repo
git clone https://github.com/ghdl/ghdl.git
cd ghdl

# using mcode backend (easiest to build)
mkdir build && cd build

# configure
../configure --prefix=/usr/local

# build
make

# install
sudo make install

# clean unecessary files
make clean
