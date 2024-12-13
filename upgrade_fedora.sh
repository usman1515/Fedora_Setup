#!/bin/bash

# Link: https://www.tecmint.com/fedora-upgrade-guide/

VERSION=40

fastfetch

# upgrade packages
sudo dnf upgrade -y --refresh

# install dnf system upgarde package if its currently installed
sudo dnf install dnf-plugin-system-upgrade

# download the upgraded packages
sudo dnf system-upgrade download --releasever=$(VERSION)
sudo dnf system-upgrade download --allowerasing -y --releasever=$(VERSION)

# trigger the upgrade process
sudo dnf system-upgrade reboot

# AFTER REBOOT

fastfetch

# update system configuration files
sudo dnf install rpmconf
sudo rpmconf -a

# clean up retired packages
sudo dnf install -y remove-retired-packages
remove-retired-packages

# list of packages with broken dependencies
sudo dnf repoquery --unsatisfied

# check for duplicates and remove them
sudo dnf repoquery --duplicates
sudo dnf remove --duplicates


