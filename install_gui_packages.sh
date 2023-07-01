#!/bin/bash

sudo dnf install -y vlc
sudo dnf install -y qbittorrent
sudo dnf install -y gtkwave
sudo dnf install -y steam
sudo dnf install -y discord
sudo dnf install -y putty
sudo dnf install -y kitty
sudo dnf install -y gnome-tweaks

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

# install sublime
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install -y sublime-text

# install spotify
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y flathub com.spotify.Client

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

# install whatsapp
flatpak install flathub -y com.github.eneshecan.WhatsAppForLinux

# install dropbox
wget -P ~/Downloads https://linux.dropbox.com/packages/fedora/nautilus-dropbox-2022.12.05-1.fedora.x86_64.rpm
sudo dnf install -y ~/Downloads/nautilus-dropbox-2022.12.05-1.fedora.x86_64.rpm

# install joplin
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

# install balena etcher
wget -P ~/Downloads https://github.com/balena-io/etcher/releases/download/v1.18.8/balena-etcher-1.18.8.x86_64.rpm
sudo dnf install -y ~/Downloads/balena-etcher-1.18.8.x86_64.rpm

# install amberol
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub io.bassi.Amberol
