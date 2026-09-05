#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

dnf5 install -y gnome-shell-extension-dash-to-dock
dnf5 remove -y waydroid
rm -f /usr/bin/waydroid-launcher
dnf5 remove -y gnome-shell-extension-gsconnect
dnf5 remove -y input-remapper
dnf5 remove -y rom-properties

# Remove other built-in GNOME Shell extensions we don't want.
# These aren't RPM packages - Bazzite builds them straight into
# /usr/share/gnome-shell/extensions/ (see ublue-os/bazzite's
# build_files/build-gnome-extensions), so we just delete the directories.
rm -rf /usr/share/gnome-shell/extensions/burn-my-windows@schneegans.github.com
rm -rf /usr/share/gnome-shell/extensions/compiz-alike-magic-lamp-effect@hermes83.github.com
rm -rf /usr/share/gnome-shell/extensions/desktop-cube@schneegans.github.com
