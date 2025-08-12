#!/bin/bash

# link: https://rpmfusion.org/Configuration

RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'
NC='\e[0m'

echo -e "${YELLOW} enable access to both the free and the nonfree repositories ${NC}"
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo -e "${YELLOW} explicitly enable the repository ${NC}"
sudo dnf config-manager --enable fedora-cisco-openh264

echo -e "${YELLOW} update all packagges in core group ${NC}"
sudo dnf groupupdate core

echo -e "${YELLOW} enable flathub ${NC}"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo -e "${YELLOW} install media codecs ${NC}"
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin --allowerasing --skip-broken

echo -e "${YELLOW} install preload (daemon that preloads frequently used apps) ${NC}"
sudo dnf copr enable elxreno/preload -y && sudo dnf install -y preload

echo -e "${YELLOW} enable 3rd party reporsitories ${NC}"
sudo dnf install -y fedora-workstation-repositories

