#!/bin/bash
#Faceți un script ce compara dacă 2 fișiere (primite ca argument) sunt identice ca si continut. (sha256sum).


hash1=$(sha256sum "$1" | awk '{print $1}')
hash2=$(sha256sum "$2" | awk '{print $1}')

if [ "$hash1" = "$hash2" ]; then
  echo "Identice"
else
  echo "Diferite"
fi

