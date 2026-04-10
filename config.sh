#Faceti un script cu numele config.sh ce face load în variabilele de mediu la variabilele definite intr-un fisier config.txt ce arată în felul următor:


#!/bin/bash
# config.sh - Load variables from config.txt into environment

CONFIG_FILE="config.txt"

# Verificăm dacă fișierul există
if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "Fișierul $CONFIG_FILE nu există!"
  exit 1
fi

# Citim fiecare linie și exportăm variabilele
while IFS=: read -r key value; do
  # Ignorăm liniile goale sau comentariile
  [[ -z "$key" || "$key" =~ ^# ]] && continue
  # Eliminăm eventualele spații
  key=$(echo "$key" | xargs)
  value=$(echo "$value" | xargs)
  # Exportăm variabila
  export "$key"="$value"
done < "$CONFIG_FILE"

echo "Variabilele au fost încărcate în mediu."
