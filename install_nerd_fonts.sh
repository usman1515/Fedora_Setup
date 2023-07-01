#!/bin/bash

# create folder
mkdir ~/.fonts

# download fonts
wget -P ~/.fonts/ https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.zip

# goto folder and unzip
cd ~/.fonts
unzip CascadiaCode.zip
