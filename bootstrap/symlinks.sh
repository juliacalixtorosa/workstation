#!/usr/bin/env bash

# ==========================================================
# Workstation Bootstrap - Symbolic Link Script
#
# Creates symbolic links from repository files to system paths.
# ==========================================================


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# ----------------------------------------------------------
# Validate arguments
# ----------------------------------------------------------

if [[ $# -ne 2 ]]; then

    error "Missing arguments."

    echo
    echo "Usage:"
    echo "    ./symlinks.sh <source> <target>"

    exit 1

fi


SOURCE="$1"
TARGET=$(expand_path "$2")


# ----------------------------------------------------------
# Validate source
# ----------------------------------------------------------

if [[ ! -e "$SOURCE" ]]; then

    error "Source file does not exist."

    echo "$SOURCE"

    exit 1

fi


# ----------------------------------------------------------
# Handle existing target
# ----------------------------------------------------------

if [[ -e "$TARGET" || -L "$TARGET" ]]; then


    # Existing symbolic link

    if [[ -L "$TARGET" ]]; then

        CURRENT_TARGET=$(readlink "$TARGET")


        if [[ "$CURRENT_TARGET" == "$SOURCE" ]]; then

            success "Symbolic link already exists."

            exit 0

        fi


        warning "Symbolic link already points somewhere else."

    else

        warning "Target already exists and is not a symbolic link."

    fi


    if ! confirm "Replace existing target?"; then

        info "Operation cancelled."

        exit 0

    fi


    rm "$TARGET"

fi


# ----------------------------------------------------------
# Create parent directory
# ----------------------------------------------------------

TARGET_DIR=$(dirname "$TARGET")

mkdir -p "$TARGET_DIR"


# ----------------------------------------------------------
# Create symbolic link
# ----------------------------------------------------------

ln -s "$SOURCE" "$TARGET"


if [[ $? -eq 0 ]]; then

    success "Symbolic link created."

    echo
    echo "$TARGET"
    echo "->"
    echo "$SOURCE"

else

    error "Failed to create symbolic link."

    exit 1

fi