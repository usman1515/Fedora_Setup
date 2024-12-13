#!/bin/bash

# torrent clients
sudo dnf install -y qbittorrent
# waveform viewer
sudo dnf install -y gtkwave
# gaming
sudo dnf install -y steam
sudo dnf install -y discord
# remote desktop clients
sudo dnf install -y putty
# sudo dnf install -y gnome-tweaks
sudo dnf install -y meld
# pdf reader
sudo dnf install -y zathura zathura-pdf-mupdf zathura-cb zathura-djvu zathura-ps
# install texmaker
sudo dnf install -y texmaker
# install virtual machine emulator
sudo dnf install virt-manager

# install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install -y code
source install_vscode_extensions.sh

# install nemo
sudo dnf install -y nemo
cp -rv nemo.desktop ~/.local/share/applications

# install remmina
sudo dnf copr enable hubbitus/remmina-next
sudo dnf upgrade --refresh 'remmina*' 'freerdp*'
sudo dnf install -y remmina

# LINK: https://linuxiac.com/how-to-install-virtualbox-on-fedora-38/
# # install virtualbox
# # install pre req tools
# sudo dnf install @development-tools
# sudo dnf install kernel-headers kernel-devel dkms
# # add virtualbox repository to fedora
# sudo cp -rv ./virtualbox.repo /etc/yum.repos.d/
# # install virtual box
# sudo dnf install -y VirtualBox-7.0
# # install virtual box extension pack (optional)
# # verify exact version of vbox
# virtualbox --help
# vboxmanage -v | cut -dr -f1
# # download the extension pack (check ver number)
# wget https://download.virtualbox.org/virtualbox/7.0.8/Oracle_VM_VirtualBox_Extension_Pack-7.0.8.vbox-extpack
# # install virtual box extensions
# sudo vboxmanage extpack install ./Oracle_VM_VirtualBox_Extension_Pack-7.0.8.vbox-extpack
# # verify installed extensions
# vboxmanage list extpacks

# install sublime
# sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
# sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
# sudo dnf install -y sublime-text

# install zoom
wget -P ~/Downloads https://zoom.us/client/5.15.2.4260/zoom_x86_64.rpm
sudo dnf install -y ~/Downloads/zoom_x86_64.rpm

# install vnc viewer
wget -P ~/Downloads https://downloads.realvnc.com/download/file/viewer.files/VNC-Viewer-7.5.1-Linux-x64.rpm
sudo dnf install -y ~/Downloads/VNC-Viewer-7.5.1-Linux-x64.rpm

# install google chrome
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install -y google-chrome-stable

# install slack
wget -P ~/Downloads https://downloads.slack-edge.com/releases/linux/4.32.127/prod/x64/slack-4.32.127-0.1.el8.x86_64.rpm
sudo dnf install -y ~/Downloads/slack-4.32.127-0.1.el8.x86_64.rpm

# install dropbox
wget -P ~/Downloads https://linux.dropbox.com/packages/fedora/nautilus-dropbox-2022.12.05-1.fedora.x86_64.rpm
sudo dnf install -y ~/Downloads/nautilus-dropbox-2022.12.05-1.fedora.x86_64.rpm

# install joplin
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

# install balena etcher
wget -P ~/Downloads https://github.com/balena-io/etcher/releases/download/v1.18.8/balena-etcher-1.18.8.x86_64.rpm
sudo dnf install -y ~/Downloads/balena-etcher-1.18.8.x86_64.rpm

# install key pass XC
sudo dnf install -y keepassxc

# ==================== Install using Flatpak

# add remote repo flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install spotify
sudo flatpak install flathub -y com.spotify.Client
# install spotube
sudo flatpak install com.github.KRTirtho.Spotube
# install whatsapp
sudo flatpak install flathub -y com.github.eneshecan.WhatsAppForLinux
# install amberol
# sudo flatpak install flathub -y io.bassi.Amberol
# install vlc
sudo flatpak install -flathub -y org.videolan.VLC
# install skype
sudo flatpak install flathub -y com.skype.Client
# install okular
# sudo flatpak install flathub -y org.kde.okular
# install pdf editor
sudo flatpak install flathub -y com.github.jeromerobert.pdfarranger
# install opera
# sudo flatpak install flathub -y com.opera.Opera
# install bottles
# sudo flatpak install flathub com.usebottles.bottles
# install bambulab studio
flatpak install flathub com.bambulab.BambuStudio

# list all flatpak packages installed
flatpak list
