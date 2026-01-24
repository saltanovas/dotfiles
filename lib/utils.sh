#!/bin/bash

# String formatters
if [ -t 1 ]; then _tty_escape() { printf '\033[%sm' "$1"; } else _tty_escape() { :; }; fi
tty_reset="$(_tty_escape '0')"
tty_bold="$(_tty_escape '1')"
tty_blue="$(_tty_escape '1;34')"

# Logging
ohai() { printf "%b==>%b %s%b\n" "$tty_blue" "$tty_bold" "$@" "$tty_reset"; }
abort() { printf "%s\n" "$@" >&2; exit 1; }

ask() {
    local answer
    read -r -p "$1 [y/N]" answer || return 1

    case "$answer" in
        [Yy]) return 0 ;;
        *)    return 1 ;;
    esac
}

ack() {
    [ "$#" -gt 0 ] && printf "%s\n" "$@"
    printf "Press RETURN/ENTER to continue, or any other key to abort:"

    local c
    read -r -n 1 c
    case "$c" in
        ""|$'\r'|$'\n') return 0 ;;
        *) return 1 ;;
    esac
}

backup() {
    local file="$1"
    if [ -f "$file" ]; then
        echo "File does not exists: '$file'"
        return 1
    fi

    local backup="$file.bak"
    local i=1

    while [[ -e "$backup" ]]; do
        backup="$backup.$i"
        ((i++))
    done

    mv "$1" "$backup"
    echo "$backup"
}
