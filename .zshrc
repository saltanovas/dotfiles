alias ..="cd .."
alias ...="cd ../.."
alias c="clear"
alias h="history | tail -20"
alias ll="ls -la"
alias please="sudo $(fc -ln -1)"

alias brewup="brew update && brew upgrade && brew cleanup && brew doctor"

mkcd() {
    mkdir -p "$1" && cd "$1"
}