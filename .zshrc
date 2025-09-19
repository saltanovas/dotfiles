alias ..="cd .."
alias ...="cd ../.."
alias ht="history | tail -20"
alias ll="ls -lAhG"
alias brewup="brew update && brew upgrade && brew cleanup && brew doctor"

mkcd() { mkdir -p "$1" && cd "$1"; }

function extract {
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

fpath=("/opt/homebrew/share/zsh/site-functions" $fpath)
fpath=("/Applications/OrbStack.app/Contents/Resources/completions/zsh" $fpath)
#  Even without modifying $fpath, zsh does NOT autoload compinit by default
autoload -U compinit && compinit -i
