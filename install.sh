#!/bin/bash

# Nobara/Fedora Plymouth Theme Installer
echo "--- Nobara Logo Plymouth Theme Installer ---"

# OS Check
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [[ "$ID" != "nobara" && "$ID" != "fedora" && "$ID_LIKE" != *"fedora"* ]]; then
        echo "ERROR: This script is intended for Nobara or Fedora-based systems only!"
        exit 1
    fi
else
    echo "ERROR: Cannot determine operating system type."
    exit 1
fi

# Root check
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run with sudo: sudo ./install.sh"
  exit 1
fi

THEME_NAME="nobara-logo"
THEME_DIR="/usr/share/plymouth/themes/$THEME_NAME"

# Determine source: Check if the folder exists, otherwise use current directory
if [ -d "nobara-logo" ]; then
    SOURCE="nobara-logo/"
elif [ -f "nobara-logo.plymouth" ]; then
    SOURCE="./"
else
    echo "Error: Theme files (nobara-logo.plymouth) not found!"
    exit 1
fi

echo "Installing theme to $THEME_DIR..."

mkdir -p "$THEME_DIR"

# Copy files (excluding the script itself and README)
cp -r ${SOURCE}* "$THEME_DIR/"
rm -f "$THEME_DIR/install.sh"
rm -f "$THEME_DIR/README.md"

echo "Setting $THEME_NAME as the default theme..."
plymouth-set-default-theme -R "$THEME_NAME"

echo "Updating initrd (dracut)... This may take a minute."
dracut -f

echo "Done! Installation finished successfully."
