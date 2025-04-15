#!/bin/bash

if [ "$1" == "--logs" ] || [ "$1" == "-l" ]; then
  if [[ "$2" =~ ^[0-9]+$ ]]; then
    for i in $(seq 1 "$2"); do
      filename="log${i}.txt"
      echo "Nazwa pliku: $filename" > "$filename"
      echo "Nazwa skryptu: $0" >> "$filename"
      echo "Data utworzenia: $(date)" >> "$filename"
    done
    echo "Utworzono $2 plików logx.txt."
  else
    echo "Podano niepoprawny argument liczby plików. Użycie: ./skrypt.sh --logs [liczba] lub ./skrypt.sh -l [liczba]"
  fi
elif [ "$1" == "--date" ] || [ "$1" == "-d" ]; then
  echo "Aktualna data: $(date)"
elif [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
  echo "Dostępne opcje:"
  echo "  --logs [liczba], -l [liczba]   - Tworzy określoną liczbę plików logx.txt (domyślnie 100)."
  echo "  --date, -d                    - Wyświetla aktualną datę."
  echo "  --help, -h                    - Wyświetla tę wiadomość pomocy."
else
  echo "Nieznana opcja. Użyj ./skrypt.sh --help lub ./skrypt.sh -h, aby zobaczyć dostępne opcje."
fi
