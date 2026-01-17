#!/bin/bash

# Nobara/Fedora Plymouth Theme Installer
# Created by hunorthman

echo "--- Nobara Logo Plymouth Theme Installer ---"

# Check if the system is Fedora-based
if [ ! -f /etc/fedora-release ]; then
    echo "ERROR: This script is intended for Nobara or Fedora-based systems only!"
    exit 1
fi

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run with sudo: sudo ./install.sh"
  exit
fi

THEME_NAME="nobara-logo"
THEME_DIR="/usr/share/plymouth/themes/$THEME_NAME"

echo "Installation in progress..."

# Create directory and copy files
mkdir -p "$THEME_DIR"
cp -r ./* "$THEME_DIR/"

# Set Plymouth theme
echo "Setting $THEME_NAME as the default theme..."
plymouth-set-default-theme -R "$THEME_NAME"

# Update initramfs (Dracut)
echo "Updating system (dracut)... This may take a moment."
dracut -f

echo "Done! The Nobara logo will appear on your next boot."
