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

cps() {
    files=("$HOME/s"/*.png(N))
    (( ${#files} )) || { echo "No screenshots found"; return 1; }

    osascript - "$files[-1]" <<'APPLESCRIPT'
on run argv
    set the clipboard to (read (POSIX file (item 1 of argv)) as «class PNGf»)
end run
APPLESCRIPT
}

reload() {
    source "$XDG_CONFIG_HOME/zsh/.zshenv"
    source "$XDG_CONFIG_HOME/zsh/.zprofile"
    source "$XDG_CONFIG_HOME/zsh/.zshrc"

    duti "$XDG_CONFIG_HOME/duti/duti.conf"
    tmux source-file "$XDG_CONFIG_HOME/tmux/tmux.conf"
    tv update-channels
}
