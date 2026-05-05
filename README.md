# hermit-os

<img src="./logo.png" height="150px" width="auto" alt="https://www.flaticon.com/authors/ains"/>

This is a custom bootc image of Fedora Silverblue.

## Changes:

### Applications

The application changes are as follows:

1. Adding `git`, `zsh`, `librewolf`, `screenfetch` and `docker`
2. Removing `google-chrome` and `PyCharm` package repositories
3. Removing `firefox`, all preinstalled GNOME packages

### GNOME

The GNOME shell changes are as follows:

1. Enabling `gnome.desktop.screensaver restart-enabled`

## Installation

Download `fedora-silverblue` and install it: https://fedoraproject.org/atomic-desktops/silverblue/download/

Open a terminal, execute: `sudo bootc switch ghcr.io/dozyhermit/hermit-os`

Done!
