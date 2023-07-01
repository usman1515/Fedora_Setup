#!/bin/bash

# create dir Tools if it doesnt exist
[ -d ~/Tools ] || mkdir -p ~/Tools
cd ~/Tools

# install prerequisites
sudo dnf install -y git help2man perl python3 make autoconf g++ flex bison ccache numactl perl-doc

# clone verilator
git clone https://github.com/verilator/verilator.git

# Every time you need to build:
unset VERILATOR_ROOT

cd verilator

git checkout master
git pull origin master
git tag
git branch -r
git checkout stable

# create configure script
autoconf

# set var
export VERILATOR_ROOT=$PWD

# configure and create makefile
./configure

# build verilator
make
make test
sudo make install
