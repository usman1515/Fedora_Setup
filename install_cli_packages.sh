#!/bin/bash

sudo dnf install -y dnf-plugins-core

sudo dnf install -y curl
sudo dnf install -y wget

sudo dnf install -y grep
sudo dnf install -y sed
sudo dnf install -y awk
sudo dnf install -y fzf
sudo dnf install -y ripgrep

# sudo dnf install -y fortune-mod
# sudo dnf install -y cowsay
sudo dnf install -y fastfetch
sudo dnf install -y cmatrix

sudo dnf install -y tmux
sudo dnf install -y vim-X11
sudo dnf install -y neovim
sudo dnf install -y bat
sudo dnf copr enable -y varlad/zellij
sudo dnf install -y zellij

sudo dnf install -y tree
sudo dnf install -y ncdu
sudo dnf install -y ffmpeg
sudo dnf install -y ImageMagick
sudo dnf copr enable -y alternateved/eza
sudo dnf install -y eza

sudo dnf install -y btop
sudo dnf install -y unzip
sudo dnf install -y p7zip
sudo dnf install -y tokei

sudo dnf install -y NetworkManager-tui
sudo dnf install -y qalculate

# sudo dnf copr enable -y pennbauman/ports
# sudo dnf install -y lf

sudo dnf copr enable -y lihaohong/yazi
sudo dnf install -y yazi
