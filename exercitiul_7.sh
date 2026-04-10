#!/bin/bash

GROUP="$1"

if [ -z "$GROUP" ]; then
    echo "Usage: $0 <group_name>"
    exit 1
fi

line=$(grep "^$GROUP:" /etc/group)

if [ -z "$line" ]; then
   exit 0
fi

echo "$line" | awk -F: '{print $4}' | tr ',' ' '