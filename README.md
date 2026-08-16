# hermit-os

<img src="./logo.png" width="auto" height="150px" alt="https://www.flaticon.com/authors/ains"/>

This is a custom bootc image of Fedora Silverblue.

## Changes:

### Applications

The application changes are as follows:

1. Adding `git`, `zsh`, `vim`
2. Removing `google-chrome` and `PyCharm` package repositories
3. Removing `firefox`, `nano`, preinstalled GNOME packages, binaries and extensions

## Installation

Download `fedora-silverblue` and install it: https://fedoraproject.org/atomic-desktops/silverblue/download/

Open a terminal, execute: `sudo bootc switch ghcr.io/dozyhermit/hermit-os`

Done!

### Post Installation

_Reference: https://codeberg.org/dozyhermit/post-install_

See above for additional actions.
