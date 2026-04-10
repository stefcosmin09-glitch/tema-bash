#!/bin/bash

#Faceți un script ce așteaptă (la nesfarsit) după un fisier pe disk sa fie creat (ce fișier doriti). După ce fișierul a fost create scriptul afișează un mesaj și iese cu succes.

FILE="test.txt"

while true
do
	if [ -f"$FILE" ]; then
		echo "Fiesierul exista"
		exit 0
	fi
	sleep 1 
done

START=$(date +%s)

while true
do
	NOW=$(date +%s)
	ELAPSED=$((NOW - START))

	if [ $ELAPSED -ge 60 ]; then
	   echo "Timeout"
	   exit 1 
	 fi
 done
