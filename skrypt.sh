#!/bin/bash

if [ "$1" == "--date" ]; then
  echo "Aktualna data: $(date)"
else
  echo "Użycie: ./skrypt.sh --date"
fi
