#!/bin/bash 

DIR="$1"
FREQ="${FRECVENTA_BACKUP:-5}"

if [ -z "$DIR" ] || [ ! -d "$DIR" ]; then
    echo "Usage: $0 <directory_valid>"
    exit 1
fi

BACKUP_DIR="$DIR/backup"
mkdir -p "$BACKUP_DIR"

declare -A HASHES 

while true; do
    for file in "$DIR"/*; do
        [ -f "$file" ] || continue

        new_hash=$(sha256sum "$file" | awk '{print $1}')
        old_hash="${HASHES[$file]}"
          
        if [ "$new_hash" != "$old_hash" ]; then
    cp "$file" "$BACKUP_DIR/"
    HASHES[$file]="$new_hash"
    echo "Backup pentru $file"
fi
    done

    sleep "$FREQ"
done