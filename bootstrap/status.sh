#!/usr/bin/env bash

# ==========================================================
# Workstation Bootstrap - Status Script
#
# Shows current symbolic link status.
# ==========================================================


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

source "$SCRIPT_DIR/common.sh"


MAPPINGS_FILE="$REPO_ROOT/config/mappings.conf"


if [[ ! -f "$MAPPINGS_FILE" ]]; then

    error "Mappings file not found."

    exit 1

fi


echo
info "Workstation symbolic links status."
echo


while IFS='|' read -r SOURCE TARGET <&3
do

    [[ -z "$SOURCE" ]] && continue
    [[ "$SOURCE" =~ ^# ]] && continue


    SOURCE_PATH="$REPO_ROOT/$SOURCE"
    TARGET_PATH=$(expand_path "$TARGET")


    echo "$TARGET_PATH"


    if [[ -L "$TARGET_PATH" ]]; then

        CURRENT_TARGET=$(readlink "$TARGET_PATH")


        if [[ "$CURRENT_TARGET" == "$SOURCE_PATH" ]]; then

            success "Valid symbolic link."
            echo "-> $CURRENT_TARGET"

        else

            warning "Symbolic link points somewhere else."
            echo "-> $CURRENT_TARGET"

        fi


    elif [[ -e "$TARGET_PATH" ]]; then

        warning "Exists but is not a symbolic link."

    else

        error "Missing."

    fi


    echo


done 3< "$MAPPINGS_FILE"