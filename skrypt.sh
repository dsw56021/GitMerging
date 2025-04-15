#!/bin/bash

create_logs() {
  local count=$1
  for i in $(seq 1 "$count"); do
    filename="log${i}.txt"
    echo "Nazwa pliku: $filename" > "$filename"
    echo "Nazwa skryptu: $0" >> "$filename"
    echo "Data utworzenia: $(date)" >> "$filename"
  done
  echo "Utworzono $count plików logx.txt."
}

create_errors() {
  local count=$1
  for i in $(seq 1 "$count"); do
    dirname="error${i}"
    filename="error${i}.txt"
    mkdir -p "$dirname"
    echo "Nazwa pliku: $dirname/$filename" > "$dirname/$filename"
    echo "Nazwa skryptu: $0" >> "$dirname/$filename"
    echo "Data utworzenia: $(date)" >> "$dirname/$filename"
  done
  echo "Utworzono $count katalogów errorX z plikami errorX.txt."
}

if [ "$1" == "--logs" ] || [ "$1" == "-l" ]; then
  count=${2:-100}
  if [[ "$count" =~ ^[0-9]+$ ]]; then
    create_logs "$count"
  else
    echo "Podano niepoprawny argument liczby plików. Użycie: ./skrypt.sh --logs [liczba] lub ./skrypt.sh -l [liczba]"
  fi
elif [ "$1" == "--error" ] || [ "$1" == "-e" ]; then
  count=${2:-100}
  if [[ "$count" =~ ^[0-9]+$ ]]; then
    create_errors "$count"
  else
    echo "Podano niepoprawny argument liczby plików. Użycie: ./skrypt.sh --error [liczba] lub ./skrypt.sh -e [liczba]"
  fi
elif [ "$1" == "--init" ]; then
  repo_url="https://github.com/dsw56021/GitMerging.git"
  target_dir=$(pwd)
  echo "Klonowanie repozytorium do katalogu: $target_dir..."
  git clone "$repo_url" "$target_dir"
  if [ $? -eq 0 ]; then
    echo "Repozytorium zostało pomyślnie sklonowane."
    echo "Dodawanie katalogu do zmiennej PATH..."
    export PATH="$target_dir:$PATH"
    echo "Aktualna wartość zmiennej PATH: $PATH"
  else
    echo "Wystąpił problem podczas klonowania repozytorium."
  fi
elif [ "$1" == "--date" ] || [ "$1" == "-d" ]; then
  echo "Aktualna data: $(date)"
elif [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
  echo "Dostępne opcje:"
  echo "  --logs [liczba], -l [liczba]   - Tworzy określoną liczbę plików logX.txt (domyślnie 100)."
  echo "  --error [liczba], -e [liczba]  - Tworzy określoną liczbę katalogów errorX z plikami errorX.txt (domyślnie 100)."
  echo "  --init                        - Klonuje repozytorium i dodaje katalog do zmiennej PATH."
  echo "  --date, -d                    - Wyświetla aktualną datę."
  echo "  --help, -h                    - Wyświetla tę wiadomość pomocy."
else
  echo "Nieznana opcja. Użyj ./skrypt.sh --help lub ./skrypt.sh -h, aby zobaczyć dostępne opcje."
fi
