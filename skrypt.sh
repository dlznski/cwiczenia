#!/bin/bash

function uzyj {
    echo "Użycie: $0 [OPCJA] [ARGUMENT] "
    echo "Opcje:"
    echo "  '--date', '-d'  Wyświetla aktulną date"
    echo "  '--logs', '-l' Utwórz 100 plików log z datą i nazwą skryptu"
    echo "  '--logs30', '-l30'  Utwórz pliki log z datą i nazwą skryptu"
    echo "  '--help', '-h' Wyświetl dostępne opcje"
}

if [ "$1" = "--date" ] || [ "$1" = "-d" ]; then
    echo "Dzisiejsza data: $(date +%Y-%m-%d)"
    exit 0
fi

if [ "$1" = "--logs" ] || [ "$1" = "-l" ]; then
    for ((i=1; i<=100; i++))
    do
    plik="log$i.txt"
    echo "Nazwa pliku: $plik" > $plik
    echo "Nazwa skryptu: $0" >> $plik
    echo "Data utworzenia: $(date)" >> $plik
    done
    exit 0
fi

if [ "$1" = "--logs30" ] || [ "$1" = "-l30" ]; then
    if [ "$2" -gt 0 ] 2>/dev/null; then
        ilosc_log=$2
    else
        ilosc_log=30
    fi

    for ((i=1; i<=ilosc_log; i++))
    do
        plik="log$i.txt"
        echo "Nazwa pliku: $plik" > $plik
        echo "Nazwa skryptu: $0" >> $plik
        echo "Data utworzenia: $(date)" >> $plik
    done

    exit 0
fi

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    uzyj
    exit 0
fi

echo "Nieznana opcja. Użyj --help, aby wyświetlić dostępne opcje."
exit 1