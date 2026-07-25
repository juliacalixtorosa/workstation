#!/usr/bin/env bash

# ==========================================================
# Workstation Bootstrap - Installation Script
#
# Reads configuration mappings and installs symbolic links.
# ==========================================================


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

source "$SCRIPT_DIR/common.sh"


MAPPINGS_FILE="$REPO_ROOT/config/mappings.conf"


# ----------------------------------------------------------
# Validate mappings file
# ----------------------------------------------------------

if [[ ! -f "$MAPPINGS_FILE" ]]; then

    error "Mappings file not found."

    echo "$MAPPINGS_FILE"

    exit 1

fi


info "Starting workstation installation."


# ----------------------------------------------------------
# Process mappings
# ----------------------------------------------------------

while IFS='|' read -r SOURCE TARGET <&3
do

    # Ignore empty lines
    [[ -z "$SOURCE" ]] && continue


    # Ignore comments
    [[ "$SOURCE" =~ ^# ]] && continue


    SOURCE_PATH="$REPO_ROOT/$SOURCE"
    TARGET_PATH=$(expand_path "$TARGET")


    echo
    info "Processing configuration:"
    echo "$SOURCE_PATH"
    echo "->"
    echo "$TARGET_PATH"


    # Backup existing target
    "$SCRIPT_DIR/backup.sh" "$TARGET_PATH"


    # Create symbolic link
    "$SCRIPT_DIR/symlinks.sh" \
        "$SOURCE_PATH" \
        "$TARGET_PATH"


done 3< "$MAPPINGS_FILE"

echo
success "Workstation installation completed."

echo
"$SCRIPT_DIR/status.sh"