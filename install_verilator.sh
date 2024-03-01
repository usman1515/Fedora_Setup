#!/bin/bash

# create dir Tools if it doesnt exist
[ -d ~/Tools ] || mkdir -p ~/Tools
cd ~/Tools

# install prerequisites
sudo dnf install -y git help2man perl python3 make autoconf g++ flex bison ccache numactl perl-doc

# clone verilator
git clone https://github.com/verilator/verilator.git

# Every time you need to build:
unset VERILATOR_ROOT # for bash shell

cd verilator

# checkout stable branch
git pull
git tag
git branch -r
git checkout master
git checkout stable

# create configure script
autoconf

# set var
export VERILATOR_ROOT=$PWD

# configure and create makefile
./configure

# build verilator
# compile
make
# test
make test
# install
sudo make install
