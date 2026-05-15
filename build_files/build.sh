#!/bin/bash

set -ouex pipefail

### Packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs/removes packages from fedora repositories or flatpak
# example: dnf5 install -y tmux 

# this removes package repositories
rm -rf /etc/yum.repos.d/_copr\:copr.fedorainfracloud.org\:phracek\:PyCharm.repo || true

dnf5 config-manager disable google-chrome
rm -rf /etc/yum.repos.d/google-chrome.repo || true

# this removes dnf packages
dnf5 remove -y firefox firefox-langpacks gnome-color-manager malcontent-control gnome-system-monitor gnome-tour yelp gnome-disk-utility

# this installs dnf packages
dnf5 install -y zsh docker screenfetch git

# this cleans dnf packages
dnf5 autoremove
dnf5 clean all

# this removes flatpak packages
flatpak remove -y --noninteractive --all

# this installs flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# this installs flatpak packages
flatpak install -y --noninteractive io.gitlab.librewolf-community

### Configurations

# this configures applications and environments
# example: systemctl enable docker.service

# this configures docker 
systemctl enable docker.service && systemctl enable containerd.service

# this configures gnome shell
gsettings set org.gnome.desktop.screensaver restart-enabled true
