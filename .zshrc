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
alias brewup="brew update && brew upgrade && brew cleanup && brew doctor"

# ==========================
# ===     Functions      ===
# ==========================
mkcd() { mkdir -p "$1" && cd "$1"; }

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

extract() {
    echo Extracting "$1" ...
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1" ;;
            *.tar.gz)    tar xzf "$1" ;;
            *.bz2)       bunzip2 "$1" ;;
            *.rar)       unrar x "$1" ;;
            *.gz)        gunzip "$1" ;;
            *.tar)       tar xf "$1" ;;
            *.tbz2)      tar xjf "$1" ;;
            *.tgz)       tar xzf "$1" ;;
            *.zip)       unzip "$1" ;;
            *.Z)         uncompress "$1" ;;
            *.7z)        7z x "$1" ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
