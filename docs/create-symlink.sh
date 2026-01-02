#!/bin/bash

# Create Symlink for Documentation
# This script creates a symbolic link from docs/sections to src
# so that VitePress can access the content without duplication

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SOURCE_PATH="$SCRIPT_DIR/../src"
TARGET_PATH="$SCRIPT_DIR/sections"

# Check if symlink already exists
if [ -L "$TARGET_PATH" ] || [ -e "$TARGET_PATH" ]; then
    echo "Symlink already exists at: $TARGET_PATH"
    exit 0
fi

# Create the symlink
if ln -s "$SOURCE_PATH" "$TARGET_PATH"; then
    echo "✓ Successfully created symlink:"
    echo "  From: $TARGET_PATH"
    echo "  To: $SOURCE_PATH"
else
    echo "✗ Failed to create symlink"
    echo "  Error: $?"
    exit 1
fi
