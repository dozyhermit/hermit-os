# hermit-os

<img src="./logo.png" height="250px" width="auto" alt="https://www.flaticon.com/authors/ains"/>

This is a custom bootc image of Fedora Silverblue.

## Changes:

### Applications

The application changes are as follows:

1. Adding `steam`
2. Adding `vscodium`
3. Adding `brew`
4. Adding `nvm`
5. Adding `zsh` and configuring `ohmyzsh`
6. Adding `librewolf`
7. Adding `rpm-fusion`
8. Adding `screenfetch`
9. Adding `docker` and configuring
10. Adding Microsoft core fonts
11. Removing `google-chrome.repo` and `PyCharm.repo` from `yum.repo.d`
12. Removing `firefox`
13. Removing all preinstalled GNOME applets

### GNOME

The GNOME shell changes are as follows:

1. Enabling `gnome.desktop.screensaver restart-enabled`

## Installation

Download `fedora-silverblue` and install it: https://fedoraproject.org/atomic-desktops/silverblue/download/.

Open a terminal and execute: `sudo bootc switch ghcr.io/dozyhermit/hermit-os`.

Done!
