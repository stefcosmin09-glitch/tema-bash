#!/bin/bash
#Scrieți un script care verifica dacă un site este available (status code între 200 si 399). Scriptul verifică de un număr maxim de ori primit tot ca argument.

code=$(curl -o /dev/null -s -w "%{http_code}" "$1")

if [ $code -ge 200 ] && [ $code -lt 400 ]; then
  echo "Site OK"
else
  echo "Site DOWN"
fi
