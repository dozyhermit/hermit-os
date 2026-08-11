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
rm -rf /etc/yum.repos.d/_copr\:copr.fedorainfracloud.org\:phracek\:PyCharm.repo
rm -rf /etc/yum.repos.d/google-chrome.repo

# this installs rpm-fusion and enables other repositories
dnf5 install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf5 install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf5 config-manager setopt fedora-cisco-openh264.enabled=1
dnf5 copr enable lizardbyte/beta

# this removes dnf packages
dnf5 remove -y firefox firefox-langpacks malcontent-control yelp gnome-color-manager gnome-system-monitor gnome-tour gnome-disk-utility gnome-remote-desktop

# this installs dnf packages
dnf5 install -y zsh git steam Sunshine

# this cleans dnf packages
dnf5 autoremove -y
dnf5 clean all -y

# this removes flatpak packages
flatpak remove -y --noninteractive --all

# this installs flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# this installs flatpak packages
flatpak install -y --noninteractive io.gitlab.librewolf-community

### Configurations

# this configures applications and environments
# example: systemctl enable docker.service
