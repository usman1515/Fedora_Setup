#!/bin/bash

# github repo: https://github.com/steveicarus/iverilog

# create dir Tools if it doesnt exist
[ -d ~/Tools ] || mkdir -p ~/Tools
cd ~/Tools

# instal dependencies
sudo dnf install -y gcc gcc-c++ autoconf automake cmake bison flex gperf readline

# readline alternatives
sudo dnf install -y lib32readline7 lib32readline-dev

# clone iverilog repo
git clone https://github.com/steveicarus/iverilog.git
cd iverilog

# generate the "configure" file
sh autoconf.sh

# compile the source
./configure
make

# run a simple test before installation
make check

# install iverilog
sudo make install

# clean dump
make clean disclean

# uninstall iverilog
# sudo make uninstall
