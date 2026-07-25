#!/usr/bin/env bash

# ==========================================================
# Workstation Bootstrap - Backup Script
#
# Creates a timestamped backup of a file before it is modified.
# ==========================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

BACKUP_DIR="$HOME/.workstation-backups"

# ----------------------------------------------------------
# Validate arguments
# ----------------------------------------------------------

if [[ $# -ne 1 ]]; then
    error "Missing file path."

    echo
    echo "Usage:"
    echo "    ./backup.sh <file>"
    exit 1
fi

TARGET_FILE="$1"

# ----------------------------------------------------------
# Validate file
# ----------------------------------------------------------

if [[ ! -f "$TARGET_FILE" ]]; then
    error "File not found."

    echo
    echo "$TARGET_FILE"

    exit 1
fi

# ----------------------------------------------------------
# Create backup directory
# ----------------------------------------------------------

mkdir -p "$BACKUP_DIR"

# ----------------------------------------------------------
# Generate backup filename
# ----------------------------------------------------------

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

FILENAME=$(basename "$TARGET_FILE")

BACKUP_FILE="$BACKUP_DIR/${FILENAME}-${TIMESTAMP}"

# ----------------------------------------------------------
# Create backup
# ----------------------------------------------------------

info "Creating backup..."



if cp -p "$TARGET_FILE" "$BACKUP_FILE"; then
    success "Backup created successfully."

    echo
    echo "Location:"
    echo "$BACKUP_FILE"
else
    error "Backup failed."

    exit 1
fi
