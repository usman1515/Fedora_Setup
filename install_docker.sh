# https://developer.fedoraproject.org/tools/docker/docker-installation.html

#!/bin/bash

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