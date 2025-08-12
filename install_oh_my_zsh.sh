#!/bin/bash

cd ~

RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'
NC='\e[0m'

echo -e "${YELLOW} install ZSH and CHSH ${NC}"
# install zsh
sudo dnf install -y zsh
# install chsh
sudo dnf install -y util-linux

# download oh my zsh
echo -e "${YELLOW} download oh my ZSH ${NC}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "${YELLOW} download zsh-syntax-highlighting ${NC}"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo -e "${YELLOW} download zsh-autosuggestions ${NC}"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo -e "${YELLOW} download zsh-autoswitch-virtualenv ${NC}"
git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" "$ZSH_CUSTOM/plugins/autoswitch_virtualenv"

echo -e "${YELLOW} download powerlevel 10k ${NC}"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

