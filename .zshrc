alias ..="cd .."
alias ...="cd ../.."
alias c="clear"
alias h="history | tail -20"
alias ll="ls -la"
alias please="sudo $(fc -ln -1)"

alias brewup="brew update && brew upgrade && brew cleanup && brew doctor"

mkcd() { mkdir -p "$1" && cd "$1"; }
conf() { nvim "$XDG_CONFIG_HOME/$1"; }

# Load Homebrew
# 
# The following may not be enough
# export PATH=$PATH:/opt/homebrew/bin
# eval "$(/opt/homebrew/bin/brew shellenv)"
# but how to split between zshrc and zprofile then?

export PATH="$HOME/.orbstack/bin:$PATH"
fpath[1,0]="/Applications/OrbStack.app/Contents/MacOS/../Resources/completions/zsh"




#  Even without modifying $fpath, zsh does NOT autoload compinit by default
autoload -U compinit && compinit -i