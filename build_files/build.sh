#!/bin/bash

set -ouex pipefail

### Packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs/removes packages from fedora repos or flatpak
# example: dnf5 install -y tmux 

# this removes rpms
rm /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:phracek:PyCharm.repo
rm /etc/yum.repos.d/google-chrome.repo
dnf5 makecache --refresh

# this installs rpm-fusion
dnf5 install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm && https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf5 makecache --refresh

# this removes dnf packages
dnf5 uninstall firefox firefox-langpacks

# this installs dnf packages
dnf5 install steam docker zsh screenfetch git

# this removes flatpak packages
xargs -r flatpak remove org.gnome.Weather org.gnome.TextEditor org.gnome.Maps org.gnome.Contacts org.gnome.clocks org.gnome.Calendar org.gnome.Calculator org.gnome.Notes org.gnome.boabab org.gnome.Connections

# this installs flatpak packages
xargs -r flatpak install flathub io.gitlab.librewolf-community

# this configures zsh & ohmyzsh
chsh -s $(which zsh)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# this installs brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# this installs brew pacakges
brew install nvm
brew install --cask vscodium

# this configures docker
groupadd docker
usermod -aG docker $USER
echo -e "docker:x:998:$USER" >> /etc/group
chmod 666 /var/run/docker.sock
systemctl enable docker.service && systemctl enable containerd.service

# this configures gnome shell
gsettings set org.gnome.desktop.screensaver restart-enabled true

# this configures mscorefonts
/bin/bash -c "$(curl -fsSL https://codeberg.org/solidc0re/atomic-fedora-mscorefonts/src/branch/main/mscorefonts-install.sh)"
