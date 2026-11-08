#!/bin/bash

mkdir -p "$HOME/.local/bin"
for file in "$DOTFILES_ROOT/.local/bin"/*; do
    [[ -f "$file" ]] || continue
    ln -sfn "$file" "$HOME/.local/bin/$(basename "$file")"
done

mkdir -p "$HOME/.local/share"
for folder in "$DOTFILES_ROOT/.local/share"/*; do
    [[ -d "$folder" ]] || continue
    ln -sfn "$folder" "$HOME/.local/share/$(basename "$folder")"
done

migrate_history() {
    [ -n "$2" ] && [ "$2" != "-" ] || return 0
    mkdir -p "$(dirname "$2")" || return
    [ ! -f "$1" ] || mv -f "$1" "$2"
}

migrate_history "$HOME/.zsh_history" "${HISTFILE:-}"
migrate_history "$HOME/.lesshst" "${LESSHISTFILE:-}"
migrate_history "$HOME/.node_repl_history" "${NODE_REPL_HISTORY:-}"
migrate_history "$HOME/.psql_history" "${PSQL_HISTORY:-}"
migrate_history "$HOME/.karaf/karaf.history" "${KARAF_HISTORY:-}"
