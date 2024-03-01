#!/bin/bash

# Link: https://pkgs.org/download/gtklp

# RPM fusion and support for 3rd poart repositories must already be enabled
# run script post_installation.sh before running this one

# download rpm package
wget -c https://github.com/rpmsphere/noarch/blob/master/r/rpmsphere-release-38-1.noarch.rpm

# install rpmsphere-release rpm:
sudo rpm -Uvh r_rpmsphere-release-38-1.noarch.rpm

# install gtklp - a frontend for cups
sudo dnf install -y gtklp
