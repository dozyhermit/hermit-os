#!/bin/bash

set -ouex pipefail

### Packages

# Packages can be installed from any enabled yum repo on the image.

# this installs/removes packages from fedora repositories or flatpak
# example: dnf5 install -y tmux 

# this configures dnf package repositories
rm -rf /etc/yum.repos.d/_copr\:copr.fedorainfracloud.org\:phracek\:PyCharm.repo
rm -rf /etc/yum.repos.d/google-chrome.repo

dnf5 install -y "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
dnf5 install -y "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

dnf5 update -y

# this removes dnf packages
dnf5 remove -y firefox firefox-langpacks malcontent-control yelp gnome-color-manager gnome-system-monitor gnome-tour gnome-disk-utility gnome-remote-desktop ImageMagick nano

# this installs dnf packages
dnf5 install -y zsh git vim

# this cleans dnf packages
dnf5 autoremove -y
dnf5 clean -y all

### Configurations

# this configures applications and environments
# example: systemctl enable docker.service
