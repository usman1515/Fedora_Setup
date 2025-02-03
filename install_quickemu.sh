#!/bin/bash

# create dir Tools if it doesnt exist
[ -d ~/Tools] || mkdir -p ~/Tools
cd ~/Tools

# install dependencies
sudo dnf install -y bash coreutils curl edk2-tools genisoimage grep jq mesa-demos pciutils \
    procps python3 qemu sed socat spice-gtk-tools swtpm unzip usbutils util-linux \
    xdg-user-dirs xrandr zsync

# clone the repo
git clone --filter=blob:none https://github.com/quickemu-project/quickemu quickemu
cd quickemu

# check version
./quickemu --version

# add to $PATH
echo 'export PATH="$HOME/quickemu:$PATH"' >> ~/.zshrc
source ~/.zshrc


