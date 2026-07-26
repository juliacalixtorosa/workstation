#!/usr/bin/env bash

# ==========================================================
# Workstation - Font Installer
#
# Installs JetBrainsMono Nerd Font for the current user.
#
# Supported systems:
#   - Linux
#
# ==========================================================

set -e

FONT_NAME="JetBrainsMono"
FONT_VERSION="3.4.0"
DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v${FONT_VERSION}/${FONT_NAME}.zip"

INSTALL_DIR="$HOME/.local/share/fonts/$FONT_NAME"
TMP_DIR=$(mktemp -d)

echo
echo "========================================="
echo " Workstation Font Installer"
echo "========================================="
echo

echo "Installing ${FONT_NAME} Nerd Font..."
echo

mkdir -p "$INSTALL_DIR"

echo "Downloading font..."

curl -L "$DOWNLOAD_URL" \
    -o "$TMP_DIR/$FONT_NAME.zip"

echo
echo "Extracting files..."

unzip -qo \
    "$TMP_DIR/$FONT_NAME.zip" \
    -d "$INSTALL_DIR"

echo
echo "Updating font cache..."

fc-cache -fv >/dev/null

rm -rf "$TMP_DIR"

echo
echo "Installation completed successfully."
echo

echo "Installed fonts:"

if fc-list | grep -qi "$FONT_NAME"; then
    echo "✔ JetBrainsMono Nerd Font installed successfully."
else
    echo "✖ Font installation failed."
    exit 1
fi

echo
echo "Next step:"
echo "Configure your terminal to use:"
echo
echo "    JetBrainsMono Nerd Font"
echo