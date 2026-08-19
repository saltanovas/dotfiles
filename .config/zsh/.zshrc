PROMPT="%n %1~ %# "
HISTFILE="$XDG_STATE_HOME/zsh/history"
ZCOMPDUMP="$XDG_CACHE_HOME/zsh/.zcompdump"

# ==========================
# ===       Fpaths       ===
# ==========================
fpath=("/opt/homebrew/share/zsh/site-functions" $fpath)
fpath=("/Applications/OrbStack.app/Contents/Resources/completions/zsh" $fpath)
# Even without modifying $fpath, zsh does NOT autoload compinit by default
autoload -U compinit && compinit -i

# ==========================
# ===      Aliases       ===
# ==========================
alias ..="cd .."
alias ...="cd ../.."
alias dot='cd "$DOTFILES_ROOT"'

# See: http://wiki.archlinux.org/index.php/Sudo#Passing_aliases
alias sudo='sudo '
alias ll="ls -lAhG"
alias duh='du -hs' # [h]uman-readable, [s]ummarize

alias now='date +%s'
alias cleanup='fd -HI --type f --glob ".DS_Store" -x rm'
alias pw="pwgen 24 -1 | pbcopy"
alias uuid="uuidgen | tr '[:upper:]' '[:lower:]' | pbcopy"

alias dutiup="duti $DOTFILES_ROOT/.config/duti/duti.conf"
alias tunnel="ssh -R 443:localhost:80 v2@connect.ngrok-agent.com http"
alias yt="yt-dlp -x -o '%(title)s.%(ext)s'"

# ==========================
# ===     Functions      ===
# ==========================
mkcd() { mkdir -p "$1" && cd "$1"; }
ht() { fc -l -"${1:-20}"; }
hta() { fc -l -"$HISTSIZE"; }

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

brewup() {
    brew update

    # See: https://docs.brew.sh/Manpage#upgrade-options-installed_formulainstalled_cask-
    echo "Upgrading installed Homebrew formulae..."
    brew upgrade
    echo "Upgrade completed."

    # See: https://docs.brew.sh/Manpage#cleanup-options-formulacask-
    echo "Removing old versions of installed Homebrew formulae..."
    brew cleanup
    echo "Cleanup completed."

    [[ "$1" == "-q" ]] && return 0

    echo "Done. You may now perform optional actions if needed:"
    echo "- List Brewfile formulae not present on the system: \$(brew bundle check)"
    echo "- Install Brewfile formulae not present on the system: \$(brew bundle)"
    echo "- List installed formulae that are not present in the Brewfile: \$(brew bundle cleanup)"
    echo "- Uninstall formulae that are not present in the Brewfile: \$(brew bundle cleanup --force)"
}

