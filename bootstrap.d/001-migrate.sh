#!/usr/bin/env bash

migrate_history() {
    [ -n "$2" ] && [ "$2" != "-" ] && [ "$1" != "$2" ] || return 0
    mkdir -p "$(dirname "$2")"
    [ ! -f "$1" ] || mv -f "$1" "$2"
}

migrate_history "$HOME/.zsh_history" "$(zsh -ic 'print -r -- $HISTFILE' 2>/dev/null)"
migrate_history "$HOME/.bash_history" "$(bash -ic 'printf %s "$HISTFILE"' 2>/dev/null)"
migrate_history "$HOME/.lesshst" "${LESSHISTFILE:-}"
migrate_history "$HOME/.node_repl_history" "${NODE_REPL_HISTORY:-}"
migrate_history "$HOME/.psql_history" "${PSQL_HISTORY:-}"
migrate_history "$HOME/.karaf/karaf.history" "${KARAF_HISTORY:-}"
