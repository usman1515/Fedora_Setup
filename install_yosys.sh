#!/bin/bash

# create dir Tools if it doesnt exist
[ -d ~/Tools ] || mkdir -p ~/Tools
cd ~/Tools

# install pre-requisites
sudo dnf install -y gcc gcc-c++ autoconf automake cmake tcl-devel git python3 \
    bison flex gperf gawk xdotool graphviz \
    readline readline-devel libffi-devel pkg-config boost zlib zlib-devel zlibrary

# clone the yosys repo
git clone https://github.com/YosysHQ/yosys.git
cd yosys

# configur the build system to use a specific compiler:
make config-gcc

# build yosys
make
# install yosys (also installs ABC)
sudo make install

# execute tests (iverilog required to be built from source)
make test

# clean all
make clean
make clean-abc

# to uninstall
# sudo make uninstall
