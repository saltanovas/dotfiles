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
alias ht="history | tail -20"
alias ll="ls -lAhG"
alias dutiup="duti $DOTFILES_ROOT/.config/duti/duti.conf"

# ==========================
# ===     Functions      ===
# ==========================
mkcd() { mkdir -p "$1" && cd "$1" }

brewup() {
    brew_bundle() {
        [ -n "$1" ] && local cmd=" $1"

        if [ $# -gt 0 ]; then
            shift
            local flags="$*"
            [ -n "$flags" ] && flags=" $flags"
        fi

        printf "${tty_blue}%s${tty_reset}" "brew bundle$cmd$flags --file=\"${BREWFILE/$HOME/\$HOME}\"";
    }

    brew update

    # See: https://docs.brew.sh/Manpage#upgrade-options-installed_formulainstalled_cask-
    ohai "Upgrading installed Homebrew formulae..."
    brew upgrade
    ohai "Upgrade completed."

    # See: https://docs.brew.sh/Manpage#cleanup-options-formulacask-
    ohai "Removing old versions of installed Homebrew formulae..."
    brew cleanup
    ohai "Cleanup completed."

    ohai "Done. You may now perform optional actions if needed:"
    echo "- List Brewfile formulae not present on the system: $(brew_bundle check)"
    echo "- Install Brewfile formulae not present on the system: $(brew_bundle)"
    echo "- List installed formulae that are not present in the Brewfile: $(brew_bundle cleanup)"
    echo "- Uninstall formulae that are not present in the Brewfile: $(brew_bundle cleanup --force)"

    unset -f brew_bundle
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
