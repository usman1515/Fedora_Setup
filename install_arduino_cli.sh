#!/bin/bash

# create dir Tools if it doesnt exist
[ -d ~/Tools/arduino_cli ] || mkdir -p ~/Tools/arduino_cli
cd ~/Tools/arduino_cli

# install pre-requisites
sudo dnf install -y hidapi

# install arduino CLI
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh; \

source $HOME/.zshrc

# check version
which arduino-cli
arduino-cli version

