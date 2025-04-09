#!/bin/bash

# ----------------------------- Text editors / IDEs
# install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install -y code
source install_vscode_extensions.sh

# sudo dnf install -y texmaker
sudo dnf install -y meld

# ----------------------------- PDF readers
sudo dnf install -y zathura zathura-pdf-mupdf zathura-cb zathura-djvu zathura-ps
sudo dnf install -y xreader
# sudo dnf install -y okular

# ----------------------------- Chat clients
# sudo dnf install -y steam
sudo dnf install -y discord
# install zoom
wget -P ~/Downloads https://zoom.us/client/5.15.2.4260/zoom_x86_64.rpm
sudo dnf install -y ~/Downloads/zoom_x86_64.rpm
# install slack
wget -P ~/Downloads https://downloads.slack-edge.com/releases/linux/4.32.127/prod/x64/slack-4.32.127-0.1.el8.x86_64.rpm
sudo dnf install -y ~/Downloads/slack-4.32.127-0.1.el8.x86_64.rpm

# ----------------------------- File managers
# install nemo
sudo dnf install -y nemo
cp -rv nemo.desktop ~/.local/share/applications

# ----------------------------- Remote desktop viewers
sudo dnf install -y putty
sudo dnf install -y x2goclient cups-x2go
# install remmina
sudo dnf copr enable hubbitus/remmina-next
sudo dnf upgrade --refresh 'remmina*' 'freerdp*'
sudo dnf install -y remmina
# install vnc viewer
wget -P ~/Downloads https://downloads.realvnc.com/download/file/viewer.files/VNC-Viewer-7.5.1-Linux-x64.rpm
sudo dnf install -y ~/Downloads/VNC-Viewer-7.5.1-Linux-x64.rpm

# ----------------------------- Torrent clients
sudo dnf install -y qbittorrent

# ----------------------------- Virtual Emulators
sudo dnf install -y qemu
sudo dnf install -y virt-manager

# ----------------------------- Web browsers
sudo dnf install -y chromium

# install librewolf
curl -fsSL https://repo.librewolf.net/librewolf.repo | pkexec tee /etc/yum.repos.d/librewolf.repo
sudo dnf install librewolf

# ----------------------------- Cloud storage
# install dropbox
wget -P ~/Downloads https://linux.dropbox.com/packages/fedora/nautilus-dropbox-2022.12.05-1.fedora.x86_64.rpm
sudo dnf install -y ~/Downloads/nautilus-dropbox-2022.12.05-1.fedora.x86_64.rpm

# ----------------------------- Others
sudo dnf install -y gtkwave
# install balena etcher
wget -P ~/Downloads https://github.com/balena-io/etcher/releases/download/v1.18.8/balena-etcher-1.18.8.x86_64.rpm
sudo dnf install -y ~/Downloads/balena-etcher-1.18.8.x86_64.rpm
# install key pass XC
sudo dnf install -y keepassxc
# install joplin
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

# ----------------------------- Media
sudo dnf install -y vlc




# ==================== Install using Flatpak

# add remote repo flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install spotify
sudo flatpak install flathub -y com.spotify.Client
# install spotube
# sudo flatpak install com.github.KRTirtho.Spotube
# install whatsapp
sudo flatpak install flathub -y com.github.eneshecan.WhatsAppForLinux
# install pdf editor
sudo flatpak install flathub -y com.github.jeromerobert.pdfarranger
# install bambulab studio
flatpak install flathub com.bambulab.BambuStudio
# install zotero
flatpak install flathub org.zotero.Zotero
# install drawio
flatpak install flathub com.jgraph.drawio.desktop

# list all flatpak packages installed
flatpak list

