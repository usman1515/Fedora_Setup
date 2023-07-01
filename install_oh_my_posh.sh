#!/bin/bash

# download and install oh my posh
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

# download Oh My Posh themes
mkdir ~/.poshthemes
wget -O ~/.poshthemes/themes.zip https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/themes.zip

# find out which shell youre using
oh-my-posh get shell
