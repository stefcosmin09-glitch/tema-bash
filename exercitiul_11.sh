#!/bin/bash

LOGFILE="$1"
INTERVAL="$2"

if [ -z "$LOGFILE" ] || [ -z "$INTERVAL" ]; then
  echo "Usage: $0 <logfile> <interval_sec>"
  exit 1
fi

while true; do
  sleep "$INTERVAL"

  timestamp=$(date +"%Y%m%d_%H%M%S")
  newfile="${LOGFILE}_$timestamp"

  cp "$LOGFILE" "$newfile"
  gzip "$newfile"
  : > "$LOGFILE"

  echo "Rotated log -> $newfile.gz"
done