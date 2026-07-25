#!/usr/bin/env bash

# ==========================================================
# Workstation Bootstrap - Common Functions
# Shared utility functions used by all bootstrap scripts.
# ==========================================================

info() {
    echo "ℹ $1"
}

success() {
    echo "✔ $1"
}

warning() {
    echo "⚠ $1"
}

error() {
    echo "✖ $1"
}

confirm() {
    read -rp "$1 [y/N]: " response

    case "$response" in
        [yY]|[yY][eE][sS])
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

expand_path() {
    echo "${1/#\~/$HOME}"
}