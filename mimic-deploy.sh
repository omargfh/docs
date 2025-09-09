#!/bin/bash

# NetLogo Documentation Deploy Mimic Script
# This script copies all documentation files to a distribution directory
# and expands the 'latest' symlink to its target directory

DIST=dist

echo "[TASK] Creating distribution directory: $DIST"

echo "    Ensuring $DIST exists"
mkdir -p "$DIST"

echo "    Cleaning existing distribution directory"
rm -rf "$DIST"/*

echo "[TASK] Copying documentation files"
EXCLUDE=("latest" "$DIST" "$(basename "$0")" ".git" ".github" ".gitignore" "README.md")
for item in *; do
    if [[ ! " ${EXCLUDE[@]} " =~ " $item " ]]; then
        echo "  Copying $item"
        cp -R "$item" "$DIST/"
    fi
done

echo "[TASK] Handling 'latest' symlink"
if [ -L "latest" ]; then
    LATEST_TARGET=$(readlink latest)
    echo "    Resolved 'latest' symlink -> $LATEST_TARGET"
    
    if [ -d "$LATEST_TARGET" ]; then
        echo "    Copying $LATEST_TARGET as latest"
        cp -R "$LATEST_TARGET"/* "$DIST/"
    else
        echo "    [WARNING] latest symlink target '$LATEST_TARGET' does not exist"
        exit 1
    fi
elif [ -d "latest" ]; then
    echo "    Copying 'latest' directory (not a symlink)"
    cp -R "latest"/* "$DIST/"
else
    echo "    [WARNING] 'latest' not found"
fi

echo "[INFO] Distribution complete! Files copied to: $DIST"
echo ""

echo "[INFO] -----------------------------------"
echo "[INFO] Total size of $DIST:"
du -sh "$DIST"
echo ""

echo "[INFO] -----------------------------------"
echo "[INFO] Size breakdown of $DIST contents (LIMIT 20):"
du -sh "$DIST"/* | sort -hr | head -20