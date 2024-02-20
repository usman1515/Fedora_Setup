#!/bin/bash

# ========== install Nerd Fonts
# create folder
mkdir ~/.fonts
# download fonts
wget -P ~/.fonts/ https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.zip
# goto folder and unzip
cd ~/.fonts
unzip CascadiaCode.zip


# ========== install generic fonts 
dnf search fonts
sudo dnf install -y libreoffice-opensymbol-fonts


# ========== install Microsoft fonts (Calibri, Times New Roman etc)
# URL: https://mscorefonts2.sourceforge.net/
# install pre req packages
sudo dnf install -y curl cabextract xorg-x11-font-utils fontconfig-devel
# install fonts
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
# update font cache
sudo fc-cache -v
