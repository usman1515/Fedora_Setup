#!/bin/bash

# install git
sudo dnf install -y git
# install C/C++
sudo dnf install -y gcc gcc-c++
# install autoconf
sudo dnf install -y autoconf automake
# install cmake
sudo dnf install -y cmake
# install python
sudo dnf install -y python3 python3-pip
# install lua
sudo dnf install -y lua
# install java
sudo dnf install -y java-openjdk
# install rust
sudo dnf install -y rust cargo
# install latex
sudo dnf install -y texlive-scheme-full




# ----- install docker
# add the docker-ce repository
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
# install the docker engine
sudo dnf install docker-ce docker-ce-cli containerd.io
# start the docker service
sudo systemctl start docker
# verify docker was correctly installed
sudo docker run hello-world
# start docker when system boots up
sudo systemctl enable docker

# setting up running run docker without sudo
# create docker group
sudo groupadd docker
# add your user to docker group
sudo usermod -aG docker $USER
# activate changes to groups
newgrp docker

# running docker commands without sudo
echo "Running hello-world without sudo"
echo " "
docker run hello-world
echo " "
echo "Reboot computer to run docker without sudo"
