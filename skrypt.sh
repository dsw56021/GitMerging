#!/bin/bash

if [ "$1" == "--date" ]; then
  echo "Aktualna data: $(date)"
else
  echo "Użycie: ./skrypt.sh --date"
fi

if [ "$1" == "--logs" ]; then
  if [[ "$2" =~ ^[0-9]+$ ]]; then
    for i in $(seq 1 "$2"); do
      filename="log${i}.txt"
      echo "Nazwa pliku: $filename" > "$filename"
      echo "Nazwa skryptu: $0" >> "$filename"
      echo "Data utworzenia: $(date)" >> "$filename"
    done
    echo "Utworzono $2 plików logx.txt."
  else
    echo "Podano niepoprawny argument liczby plików. Użycie: ./skrypt.sh --logs [liczba]"
  fi
else
  echo "Użycie: ./skrypt.sh --logs [liczba]"
fi