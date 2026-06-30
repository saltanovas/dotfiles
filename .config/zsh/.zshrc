PROMPT="%n %1~ %# "

# ==========================
# ===       Fpaths       ===
# ==========================
fpath=("/opt/homebrew/share/zsh/site-functions" $fpath)
fpath=("/Applications/OrbStack.app/Contents/Resources/completions/zsh" $fpath)
#  Even without modifying $fpath, zsh does NOT autoload compinit by default
autoload -U compinit && compinit -i

# ==========================
# ===      Aliases       ===
# ==========================
alias ..="cd .."
alias ...="cd ../.."
# See: http://wiki.archlinux.org/index.php/Sudo#Passing_aliases
alias sudo='sudo '
alias now='date +%s'
alias ll="ls -lAhG"
alias dutiup="duti $DOTFILES_ROOT/.config/duti/duti.conf"

# ==========================
# ===     Functions      ===
# ==========================
mkcd() { mkdir -p "$1" && cd "$1" }
ht() { fc -l -"${1:-20}" }

findport() {
    local IFS=,
    sudo lsof -nP -i:"$*"
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

ytd() {
    echo "🎧 Downloading the best available audio..."
    if yt-dlp -f bestaudio --extract-audio --audio-format m4a --no-playlist "$@"; then
        echo "✅ Download complete!"
        return 0
    fi

    echo "⚠️ High-quality stream is not available, falling back to MP4 and extracting audio..."
    if yt-dlp -f best --extract-audio --audio-format m4a --no-playlist "$@"; then
        echo "✅ Download complete!"
        return 0
    fi

    echo "❌ Download failed."
    return 1
}

unarchive() {
    if [ $# -eq 0 ]; then
        echo "Usage: unarchive <file>..."
        return 1
    fi

    for file in "$@"; do
        if [ ! -f "$file" ]; then
            echo "$file is not a valid file"
            continue
        fi

        echo "Unarchiving $file ..."
        case "$file" in
            *.tar.bz2)   tar xjf "$file" ;;
            *.tar.gz)    tar xzf "$file" ;;
            *.bz2)       bunzip2 "$file" ;;
            *.rar)       unrar x "$file" ;;
            *.gz)        gunzip "$file" ;;
            *.tar)       tar xf "$file" ;;
            *.tbz2)      tar xjf "$file" ;;
            *.tgz)       tar xzf "$file" ;;
            *.zip)       unzip "$file" ;;
            *.Z)         uncompress "$file" ;;
            *.7z)        7z x "$file" ;;
            *)           echo "'$file' file type is not supported" ;;
        esac
    done
}
