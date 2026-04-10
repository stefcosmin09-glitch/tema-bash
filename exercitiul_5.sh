#!/bin/bash

# Verificare variabilă obligatorie
if [ -z "$BACKUP_FILE_PATH" ]; then
  echo "Eroare: BACKUP_FILE_PATH nu este setata!"
  exit 1
fi

# Director backup (default: backup)
BACKUP_DIR="${BACKUP_DIR:-backup}"

mkdir -p "$BACKUP_DIR"

FILE_NAME=$(basename "$BACKUP_FILE_PATH")
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")

# Hash fișier curent
CURRENT_HASH=$(sha256sum "$BACKUP_FILE_PATH" | awk '{print $1}')

FOUND_SAME=0

for f in "$BACKUP_DIR"/"$FILE_NAME"_*; do
  [ -e "$f" ] || continue
  HASH=$(sha256sum "$f" | awk '{print $1}')
  
  if [ "$HASH" == "$CURRENT_HASH" ]; then
    mv "$f" "$BACKUP_DIR/${FILE_NAME}_$TIMESTAMP"
    FOUND_SAME=1
    break
  fi
done

if [ $FOUND_SAME -eq 0 ]; then
  cp "$BACKUP_FILE_PATH" "$BACKUP_DIR/${FILE_NAME}_$TIMESTAMP"
fi
