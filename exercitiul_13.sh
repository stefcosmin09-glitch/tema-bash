#!/bin/bash

CMD="$1"

if [ -z "$CMD" ]; then
  echo "Usage: $0 <comanda>"
  exit 1
fi

IFS=':' read -ra PATHS <<< "$PATH"

found=0

for p in "${PATHS[@]}"; do
  if [ -x "$p/$CMD" ]; then
    echo "$p/$CMD"
    found=1
  fi
done

if [ "$found" -eq 0 ]; then
  echo "Comanda nu a fost gasita"
  exit 1
fi