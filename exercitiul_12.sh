#!/bin/bash

DIR="$1"

if [ -z "$DIR" ] || [ ! -d "$DIR" ]; then
  echo "Usage: $0 <director>"
  exit 1
fi

for file in "$DIR"/*.sh; do
  [ -f "$file" ] || continue

  first_line=$(head -n 1 "$file")

  if [[ "$first_line" != "#!"* ]]; then
    sed -i '1i #!/bin/bash' "$file"
    echo "Adaugat shebang in $file"
  fi
done