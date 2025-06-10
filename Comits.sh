#!/bin/bash

# FECHA DE INICIO (la que pediste)
inicio="2025-06-10"
# FECHA FINAL (HOY)
fin=$(date +%Y-%m-%d)

# Carpeta del repositorio actual
repo="."

cd "$repo" || exit

current_date="$inicio"
while [ "$current_date" != "$(date -I -d "$fin + 1 day")" ]; do
  for i in {1..32}; do
    echo "Commit $i del día $current_date" >> log.txt
    git add log.txt
    GIT_AUTHOR_DATE="$current_date 12:00:00" \
    GIT_COMMITTER_DATE="$current_date 12:00:00" \
    git commit -m "Commit $i del día $current_date"
  done
  current_date=$(date -I -d "$current_date + 1 day")
done
