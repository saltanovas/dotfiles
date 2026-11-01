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

