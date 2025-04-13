#!/bin/bash

SOURCE_FOLDER=${SOURCE_FOLDER:-/data/source}
TARGET_FOLDER=${TARGET_FOLDER:-/data/target}
LOCKFILE="/tmp/folder_sync.lock"

log() {
    echo "[$(date)] $1"
}

if [ -e "$LOCKFILE" ]; then
    log "Sync already running. Exiting."
    exit 1
fi

# Create lockfile
touch "$LOCKFILE"

log "Starting sync from $SOURCE_FOLDER to $TARGET_FOLDER"

# Perform sync
rsync -ah --info=progress2 --ignore-existing "$SOURCE_FOLDER/" "$TARGET_FOLDER/" 2>&1

log "Sync completed."

# Remove lockfile
rm -f "$LOCKFILE"
