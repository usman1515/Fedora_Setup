#!/bin/bash

# link: https://rpmfusion.org/Configuration

# enable access to both the free and the nonfree repositories
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# explicitly enable the repository
sudo dnf config-manager --enable fedora-cisco-openh264

# appstream metadata to enable users to install packages using Gnome/KDE
sudo dnf groupupdate core

# enable flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install media codecs
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin --allowerasing --skip-broken

# install preload
sudo dnf copr enable elxreno/preload -y && sudo dnf install -y preload

# enable 3rd party reporsitories
sudo dnf install -y fedora-workstation-repositories
    