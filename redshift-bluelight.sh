#!/bin/bash

ICONS=("" "" "")
INDEX_FILE="index.txt"

if [[ ! -f $INDEX_FILE ]]; then
    echo 0 >"$INDEX_FILE"
fi

index=$(<"$INDEX_FILE")

print_icon() {
    echo "${ICONS[index]}"
}

increment_icon() {
    index=$(((index + 1) % ${#ICONS[@]}))
    echo "$index" >"$INDEX_FILE"
}

if [[ $# -eq 0 ]]; then
    echo "Por favor, forneça um comando (incrementar ou mostrar)."
    exit 1
fi

case $1 in
mostrar)
    print_icon
    ;;
incrementar)
    increment_icon
    print_icon

    if [[ $index -eq 0 ]]; then
        redshift -l 24.7335773514906:-53.71932206893908 -o -P &

    elif [[ $index -eq 1 ]]; then
        redshift -x &

    elif [[ $index -eq 2 ]]; then
        redshift -O 5000 &
    fi
    ;;
*)
    echo "Comando inválido. Use 'mostrar' ou 'incrementar'."
    exit 1
    ;;
esac
