alias ..="cd .."
alias ...="cd ../.."
alias dot='cd "$DOTFILES_ROOT"'

# See: http://wiki.archlinux.org/index.php/Sudo#Passing_aliases
alias sudo='sudo '
alias ll="ls -lAhG"
alias duh='du -hs' # [h]uman-readable, [s]ummarize

alias now='date +%s'
alias cleanup='fd -HI --type f --glob ".DS_Store" -x rm --'
alias pw="pwgen 24 -1 | pbcopy"
alias uuid="uuidgen | tr '[:upper:]' '[:lower:]' | pbcopy"

alias dutiup='duti "$XDG_CONFIG_HOME/duti/duti.conf"'
alias tunnel="ssh -R 443:localhost:80 v2@connect.ngrok-agent.com http"
alias yt="yt-dlp -x -o '%(title)s.%(ext)s'"
