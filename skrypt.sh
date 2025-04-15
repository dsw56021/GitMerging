#!/bin/bash

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
elif [ "$1" == "--date" ]; then
  echo "Aktualna data: $(date)"
elif [ "$1" == "--help" ]; then
  echo "Dostępne opcje:"
  echo "  --logs [liczba]  - Tworzy określoną liczbę plików logx.txt (domyślnie 100)."
  echo "  --date           - Wyświetla aktualną datę."
  echo "  --help           - Wyświetla tę wiadomość pomocy."
else
  echo "Nieznana opcja. Użyj ./skrypt.sh --help, aby zobaczyć dostępne opcje."
fi