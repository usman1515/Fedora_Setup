#!/bin/bash

RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'
NC='\e[0m'

echo -e "${YELLOW} clone and install nerd fonts ${NC}"
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git ~/nerd_fonts
cd ~/nerd_fonts

./install.sh FiraCode
./install.sh FiraMono
./install.sh CascadiaCode
./install.sh CascadiaMono

echo -e "${YELLOW} install generic fonts ${NC}"
dnf search fonts
sudo dnf install -y libreoffice-opensymbol-fonts

echo -e "${YELLOW} install Microsoft fonts (Calibri, Times New Roman etc) ${NC}"
# URL: https://mscorefonts2.sourceforge.net/
# install pre req packages
sudo dnf install -y curl cabextract xorg-x11-font-utils fontconfig-devel
# install fonts
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
# update font cache
sudo fc-cache -v

