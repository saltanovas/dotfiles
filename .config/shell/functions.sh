mkcd() { mkdir -p "$1" && cd "$1"; }

# TODO: fdp maybe?
findport() {
    local IFS=,
    lsof -nP -i:"$*"
}

killport() {
    sudo -v || return 1
    if [ "$#" -eq 0 ]; then
        echo "Usage: killport <port> [port ...]"
        return 1
    fi

    rc=0
    for port in "$@"; do
        if ! pids=$(sudo lsof -ti :"$port"); then
            rc=1
            [ -z "$pids" ] && printf 'No process found on port %s\n' "$port" >&2
            continue
        fi

        if ! sudo kill -9 $pids; then
            rc=1
            printf 'Failed to kill process on port %s\n' "$port" >&2
            continue
        fi
    done

    return $rc
}

nvm() {
    echo "Use 'mise' instead of 'nvm'."
    echo
    echo "Examples:"
    echo "  mise install"
    echo "  mise use node@24"
    echo "  mise current node"
    return 1
}

pyenv() {
    echo "Use 'mise' instead of 'pyenv'."
    echo
    echo "Examples:"
    echo "  mise install"
    echo "  mise use python@3.14"
    echo "  mise current python"
    return 1
}

a() {
    set -- "$(
        alias | sort |
            while IFS= read -r definition; do
                set -- "${definition%%=*}" "${definition#*=}"
                eval "set -- \"\$1\" $2"
                case $2 in
                    *' ') printf "%s\t|\t'%s'\n" "$1" "$2" ;;
                    *)    printf '%s\t|\t%s\n' "$1" "$2" ;;
                esac
            done |
            column -t -s "$(printf '\t')" |
            fzf --exact --ignore-case --no-multi \
                --height 90% --layout reverse --border rounded \
                --pointer "▸" --highlight-line \
                --color 'hl:81,hl+:81,fg+:255,bg+:236,pointer:42' \
                --delimiter ' +\| +' \
                --accept-nth '{1}' \
                --preview 'printf "%s\n" {2..}' \
                --preview-window 'down,3,wrap,border-top'
    )"
    [ -n "$1" ] || return 0
    gum style --foreground 42 --bold "╭─ ✦ $1"
    gum style --foreground 81 "╰─ ▸ $(alias "$1" | sed 's/^[^=]*=//')"
    eval "$1"
}
