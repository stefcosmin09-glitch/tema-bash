#!/bin/bash

SRC="$1"
DST="$2"

if [ -z "$SRC" ] || [ -z "$DST" ] || [ "$SRC" = "$DST" ]; then
  echo "Usage: $0 <grup_sursa> <grup_destinatie>"
  exit 1
fi

users=$(grep "^$SRC:" /etc/group | awk -F':' '{print $4}' | tr ',' ' ')

for user in $users; do
  sudo usermod -aG "$DST" "$user"
  echo "Adaugat $user in $DST"
done