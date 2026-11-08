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

# Kill
alias kport='print -z -- "$(command kport)"'

# Output & copy
alias copy='pbcopy'
alias cpwd='pwd | tee >(pbcopy)'
alias cnow='date +%s | tee >(pbcopy)'
alias cpw='pw | tee >(pbcopy)'
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
alias pw='head -c 32 /dev/urandom | base64'
alias tunnel='ssh -R 443:localhost:80 v2@connect.ngrok-agent.com http'
alias yt='yt-dlp -x -o "%(title)s.%(ext)s"'

# Git
alias greset='git reset --soft HEAD~1'
alias gundo='git reset --soft ORIG_HEAD'
alias gp='git push'
alias gpf='git push --force'

# Reload
alias rtv='tv update-channels'
alias rt='tmux source-file "$XDG_CONFIG_HOME/tmux/tmux.conf"'
alias rd='duti "$XDG_CONFIG_HOME/duti/duti.conf"'
alias rz='source "$XDG_CONFIG_HOME/zsh/.zshrc" && source "$XDG_CONFIG_HOME/zsh/.zprofile" && source "$XDG_CONFIG_HOME/zsh/.zshenv"'
alias rr='rtv && rt && rd && rz'
