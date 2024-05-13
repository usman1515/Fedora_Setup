#!/bin/bash

# installation: https://www.flopoco.org/flopoco_installation.html

# create dir docker_flopoco if it doesnt exist
[ -d ~/Tools/docker_flopoco ] || mkdir -p ~/Tools/docker_flopoco
cd ~/Tools/docker_flopoco

# download docker image file
wget https://www.flopoco.org/Docker/Dockerfile.4.1.2

# add the following alias in .bash_aliases
alias flopoco="docker run --rm=true -v `pwd`:/flopoco_workspace flopoco"

# build docker image in pwd
docker build -f flopoco -f Dockerfile.4.1.2 .
