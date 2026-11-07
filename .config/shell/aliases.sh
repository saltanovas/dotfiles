# Quick navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .p='cd "$HOME/p"'
alias .w='cd "$HOME/w"'

# Quick edit
alias cfg='code "$XDG_CONFIG_HOME" "$DOTFILES_ROOT"'
alias dot='config'
alias som='code "$HOME/w/code/som-se-eoc"'

# List
alias ll='ls -lAhG '
alias lls='ll -S'
alias llt='ll -t'

# Search
# 'xargs -I {}' treats the whole line as one argument, preserving the space 
alias ff='fd --type f --hidden \
    --exclude .git \
    --exclude .DS_Store \
    | fzf \
    | xargs -I {} realpath "{}" \
    | tee /dev/tty >(pbcopy) \
    | xargs -I {} code -- "{}"'

# Output & copy
alias cpwd='pwd | tee >(pbcopy)'
alias cnow='date +%s | tee >(pbcopy)'
alias cpw='pwgen -s -y -1 24 | tee >(pbcopy)'
alias cuuid="uuidgen | tr '[:upper:]' '[:lower:]' | tee >(pbcopy)"

alias duh='du -hs' # [h]uman-readable, [s]ummarize
alias sudo='sudo ' # See: http://wiki.archlinux.org/index.php/Sudo#Passing_aliases
alias rmds='fd -HI --type f --glob ".DS_Store" --exclude "$HOME/Applications" -x rm --'

# List
alias tva='print -zr -- "$(tv alias --inline --no-status-bar --no-preview)"'
alias tvd='() {
  local dir
  while dir=$(tv dirs --inline --no-status-bar --input-header "$PWD"); do
    [[ -n $dir && ! $dir -ef . ]] || break
    builtin cd -- "$dir" || break
  done
}'
alias tvf='tv files'
alias tvt='tv text'
alias tvh='print -zr -- "$(tv zsh-history --inline --no-status-bar)"'
alias tvgl='tv git-log'

# Tools
alias tunnel='ssh -R 443:localhost:80 v2@connect.ngrok-agent.com http'
alias yt='yt-dlp -x -o "%(title)s.%(ext)s"'

# Git
alias greset='git reset --soft HEAD~1'
alias gundo='git reset --soft ORIG_HEAD'
alias gp='git push'
alias gpf='git push --force'
